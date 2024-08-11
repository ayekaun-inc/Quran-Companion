import 'package:quran_companion/global/models/ayat_model.dart';
import 'package:quran_companion/global/models/ayat_list_view_arguments.dart';
import 'package:quran_companion/global/repositories/ayat_repository.dart';
import 'package:quran_companion/global/utils/enums.dart';
import 'package:quran_companion/global/utils/ui_helpers.dart';
import 'package:quran_companion/global/widgets/dialogs/options_dialog/options_dialog_data.dart';
import 'package:quran_companion/global/setup/dialog_setup.dart';
import 'package:quran_companion/global/utils/routes.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AyatRepository _ayatRepository = AyatRepository();
  final BuildContext context;

  HomeViewModel(this.context);

  String _searchText = '';
  String get searchText => _searchText;

  bool _searchIsEmptyError = true;
  bool get searchIsEmptyError => _searchIsEmptyError;

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  void _setIsSearching(bool val) {
    _isSearching = val;
    rebuildUi();
  }

  void _validateSearchText() {
    _searchIsEmptyError = _searchText.isEmpty;
    rebuildUi();
  }

  void onSearchTextChanged(String text) {
    _searchText = text;
    _validateSearchText();
  }

  void onSearchTextSubmitted(String? text) {
    _handleSearch();
  }

  void onSearchPress() {
    _handleSearch();
  }

  Future<void> _handleSearch() async {
    collapseKeyboard(context);
    if (!_searchIsEmptyError) {
      _setIsSearching(true);
      List<AyatModel> searchResults =
          _ayatRepository.getAyatByUrdu(_searchText);
      await simulateLoading(duration: const Duration(seconds: 1));
      _setIsSearching(false);
      _navigationService.navigateTo(
        ayatListView,
        arguments: AyatListViewArguments(
          title: 'Search Results',
          subtitle: "by word '$_searchText'",
          ayats: searchResults,
          highligtedTerm: _searchText,
        ),
      );
    }
  }

  Future<void> onReadQuranPressed() async {
    await _showReadingModeOptionsDialog();
  }

  Future<void> _showReadingModeOptionsDialog() async {
    await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.options,
      data: OptionsDialogData(
        option1: 'By Surah',
        option2: 'By Para',
        onOption1Pressed: () => _onReadingModePressed(mode: ReadingMode.surah),
        onOption2Pressed: () => _onReadingModePressed(mode: ReadingMode.para),
      ),
    );
  }

  void _onReadingModePressed({required ReadingMode mode}) {
    _navigationService.back();
    _navigationService.navigateTo(
      surahParaListView,
      arguments: mode,
    );
  }
}
