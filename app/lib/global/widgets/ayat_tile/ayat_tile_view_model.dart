import 'package:quran_companion/global/setup/bottom_sheet_setup.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AyatTileViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  Future<void> onMakeNoteTap() async {
    /// set isNoting to true for loading and on tap null
    ///
    /// Check for pre-existing note
    /// if exists, show bottom sheet with it
    /// if doesnt exist, show bottom sheet without it and with hint text
    ///
    /// ontextchange
    /// if not same as before save button enabled
    ///
    /// on save press, if enabled, save note, show snackbar note saved, disable button
    ///
    /// set isNoting to false for loading done and on tap not null
    ///
    /// on press close if changes not saved show disclaimer are you sure typpa alert dialog
    await _showNoteDialog();
  }

  void onSavePdfTap() {}

  Future<void> _showNoteDialog() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.note,
      barrierDismissible: true,
      enableDrag: true,
    );
  }
}
