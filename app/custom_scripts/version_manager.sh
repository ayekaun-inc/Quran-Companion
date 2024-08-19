#!/bin/sh

# Get the absolute path of the directory where the script is located
SCRIPT_DIR=$(dirname $(realpath $0))

# Determine the project root (one level up from the script directory)
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")

# Display the main menu for choosing between build number and version increment
function info() {
    cat <<EOF

    Please choose what you want to increment:
    [1] Build Number
    [2] Version (Major, Minor, Patch)

EOF
}

# Display the menu for selecting the type of version increment
function version_info() {
    cat <<EOF

    Please enter [1] [2] [3] for the required version increment:

    [1] Major Increment
    [2] Minor Increment
    [3] Patch Increment

EOF
}

# Display an error message for invalid inputs
function error() {
    red='\033[0;31m'
    echo "${red}Invalid Argument. Please run the command again.${red}"
}

info

yellow='\033[0;33m'
clear='\033[0m'

echo $yellow
read -p "Enter your choice: " choice
echo ''
echo $clear

# If the user chooses to increment the build number
if [ "$choice" == '1' ]; then
    function incrementBuildNumber() {
        echo "${yellow}Incrementing build number...${clear}"
        
        # Fetch and increment the Android build number
        existing_version_with_code=$(cat "$PROJECT_ROOT/pubspec.yaml" | grep version: | awk -F 'version:' '{print $2}' | sed  's/ //g')
        existing_version_android=$(echo $existing_version_with_code | awk -F '+' '{print $1}')
        existing_code_android=$(echo $existing_version_with_code | awk -F '+' '{print $2}')
        if [ -z "$existing_code_android" ]; then
            existing_code_android=0
        fi
        let "new_code_android=existing_code_android+1"
        new_version_android="${existing_version_android}+${new_code_android}"
        sed -i "s/version: $existing_version_with_code/version: $new_version_android/" "$PROJECT_ROOT/pubspec.yaml"
        echo "Android build number updated from $existing_code_android to $new_code_android"

        # Fetch and increment the iOS build number
        existing_code_ios=$(cat "$PROJECT_ROOT/ios/Runner.xcodeproj/project.pbxproj" | grep CURRENT_PROJECT_VERSION | head -1 | awk -F ' = ' '{print $2}' | sed 's/;//g')
        if [ -z "$existing_code_ios" ]; then
            existing_code_ios=0
        fi
        let "new_code_ios=existing_code_ios+1"
        sed -i "s/CURRENT_PROJECT_VERSION = ${existing_code_ios}/CURRENT_PROJECT_VERSION = ${new_code_ios}/" "$PROJECT_ROOT/ios/Runner.xcodeproj/project.pbxproj"
        echo "iOS build number updated from $existing_code_ios to $new_code_ios"
    }

    incrementBuildNumber
    exit 0

# If the user chooses to increment the version
elif [ "$choice" == '2' ]; then
    version_info

    echo $yellow
    read -p "Enter your choice: " input
    echo ''
    echo $clear

    if [ "$input" == '' ]; then 
        error
        exit
    fi

    # If the input is valid, proceed with the version increment
    if (( $input > 0 )) && (( $input < 4 )); then
        function incrementIosVersion() {
            # Fetch current iOS version and build number
            existing_version_ios=$(cat ios/Runner.xcodeproj/project.pbxproj | grep MARKETING_VERSION | head -1 | awk -F ' = ' '{print $2}' | sed 's/;//g')
            existing_code_ios=$(cat ios/Runner.xcodeproj/project.pbxproj | grep CURRENT_PROJECT_VERSION | head -1 | awk -F ' = ' '{print $2}' | sed 's/;//g')

            # Split version number into major, minor, and patch components
            major=$(echo $existing_version_ios | awk -F '.' '{print $1}')
            minor=$(echo $existing_version_ios | awk -F '.' '{print $2}')
            patch=$(echo $existing_version_ios | awk -F '.' '{print $3}')

            # Increment the appropriate version component based on user input
            if [ "$input" == '1' ]; then
                let "major++"
                minor=0
                patch=0
                new_code_ios=1 # Reset build number
            elif [ "$input" == '2' ]; then
                let "minor++"
                patch=0
                new_code_ios=1 # Reset build number
            elif [ "$input" == '3' ]; then
                let "patch++"
                let "new_code_ios++" # Increment build number
            fi

            # Update iOS version and build number in the project file
            new_version_ios=${major}.${minor}.${patch}
            sed "s/MARKETING_VERSION = ${existing_version_ios}/MARKETING_VERSION = ${new_version_ios}/g" ios/Runner.xcodeproj/project.pbxproj > ios_version_number
            sed "s/CURRENT_PROJECT_VERSION = ${existing_code_ios}/CURRENT_PROJECT_VERSION = ${new_code_ios}/g" ios_version_number > ios_version_code
            cat ios_version_code > ios/Runner.xcodeproj/project.pbxproj
            rm ios_version_code ios_version_number
            echo "${green}iOS Version updated successfully!${clear}"
        }

        function incrementAndroidVersion() {
            # Fetch current Android version and build number
            existing_version_with_code=$(cat pubspec.yaml | grep version: | awk -F 'version:' '{print $2}' | sed  's/ //g')
            existing_version_android=$(echo $existing_version_with_code | awk -F '+' '{print $1}')
            existing_code_android=$(echo $existing_version_with_code | awk -F '+' '{print $2}')

            # Split version number into major, minor, and patch components
            major=$(echo $existing_version_android | awk -F '.' '{print $1}')
            minor=$(echo $existing_version_android | awk -F '.' '{print $2}')
            patch=$(echo $existing_version_android | awk -F '.' '{print $3}')

            # Increment the appropriate version component based on user input
            if [ "$input" == '1' ]; then
                let "major++"
                minor=0
                patch=0
                new_code_android=1 # Reset build number
            elif [ "$input" == '2' ]; then
                let "minor++"
                patch=0
                new_code_android=1 # Reset build number
            elif [ "$input" == '3' ]; then
                let "patch++"
                let "new_code_android++" # Increment build number
            fi

            # Update Android version and build number in the pubspec.yaml file
            new_version_android=${major}.${minor}.${patch}+${new_code_android}
            sed "s/${existing_version_with_code}/${new_version_android}/g" pubspec.yaml >android_version
            cat android_version >pubspec.yaml
            rm android_version
            echo "${green}Android Version updated successfully!${clear}"
        }

        incrementAndroidVersion
        echo ''
        incrementIosVersion
        echo ''
    else 
        error
        exit
    fi

else
    error
    exit
fi
