import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/svg_constants.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_gap.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

/// A customizable app bar widget with a title, subtitle, and back button.
///
/// The `CustomAppBar` widget provides a consistent app bar design featuring
/// a title, subtitle, and back button. It integrates with the `NavigationService`
/// for back navigation and allows for custom titles and subtitles. The app bar
/// also includes a drop shadow and adjusts its layout based on the device's
/// status bar height.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The navigation service used for handling back navigation.
  final NavigationService _navigationService = locator<NavigationService>();

  /// The primary title displayed in the app bar.
  final String title;

  /// The subtitle displayed below the title in the app bar.
  final String subtitle;

  /// Creates a `CustomAppBar` widget with a [title] and [subtitle].
  ///
  /// The [title] and [subtitle] are required and are displayed prominently
  /// in the app bar. The back button is provided by default and is linked
  /// to the navigation service for back navigation.
  CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: shadow.withOpacity(0.2),
            offset: Offset(0, 8.h),
            blurRadius: 16.r,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Adds a vertical gap equal to the height of the status bar
          VerticalGap(MediaQuery.of(context).viewPadding.top),
          Container(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: _navigationService.back,
                  icon: SvgPicture.asset(
                    backIcon,
                    width: 21.w,
                  ),
                ),
                const HorizontalGap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title,
                      size: 16,
                      font: poppinsSemiBold,
                      color: green,
                    ),
                    CustomText(
                      subtitle,
                      size: 14,
                      font: poppinsMediumItalic,
                      color: brown,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalGap(13),
        ],
      ),
    );
  }

  /// Specifies the preferred height of the app bar.
  ///
  /// The preferred height is set to the maximum finite size, ensuring the
  /// app bar adapts to the content's height.
  @override
  Size get preferredSize => const Size.fromHeight(double.maxFinite);
}
