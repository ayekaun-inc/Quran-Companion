import 'package:app/global/widgets/dialogs/options_dialog/options_dialog_data.dart';
import 'package:app/global/setup/dialog_setup.dart';
import 'package:app/global/utils/routes.dart';
import 'package:app/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _searchText = '';
  String get searchText => _searchText;
  void onSearchTextChange(String? text) {
    if (text != null) _searchText = text;
  }

  void onSearchPressed() {
    // TODO: Add search logic
  }

  Future<void> onReadQuranPressed() async {
    await showReadingModeOptionsDialog();
  }

  Future<void> showReadingModeOptionsDialog() async {
    await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.options,
      data: OptionsDialogData(
        option1: 'By Surah',
        option2: 'By Para',
        onOption1Pressed: () => onReadingModePressed(surahListView),
        onOption2Pressed: () => onReadingModePressed(paraListView),
      ),
    );
  }

  void onReadingModePressed(String route) {
    _navigationService.back();
    _navigationService.navigateTo(route);
  }
}
