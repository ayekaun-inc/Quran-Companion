import 'package:app/global/utils/ui_helpers.dart';
import 'package:app/global/widgets/dialogs/options_dialog/options_dialog_data.dart';
import 'package:app/global/setup/dialog_setup.dart';
import 'package:app/global/utils/routes.dart';
import 'package:app/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BuildContext context;

  HomeViewModel(this.context);

  String _searchText = '';
  String get searchText => _searchText;

  bool _searchIsEmptyError = true;
  bool get searchIsEmptyError => _searchIsEmptyError;

  void _validateSearchText() {
    _searchIsEmptyError = _searchText.isEmpty;
    rebuildUi();
  }

  void onSearchTextChanged(String text) {
    _searchText = text;
    _validateSearchText();
  }

  void onSearchTextSubmitted(String? text) {
    handleSearch();
  }

  void onSearchPressed() {
    handleSearch();
  }

  void handleSearch() {
    collapseKeyboard(context);
    if (!_searchIsEmptyError) {
      // TODO: Add search
      _navigationService.navigateTo(searchResultsView);
    }
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
