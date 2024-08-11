import 'package:quran_companion/global/setup/bottom_sheet_setup.dart';
import 'package:quran_companion/global/setup/snackbar_setup.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AyatTileViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool _isMakingNote = false;

  bool get isMakingNote => _isMakingNote;

  final int ayatNumber;
  AyatTileViewModel({required this.ayatNumber});

  Future<void> onMakeNoteTap() async {
    _setIsMakingNote(true);
    await _showNoteDialog();
    _setIsMakingNote(false);
  }

  void _setIsMakingNote(bool val) {
    _isMakingNote = val;
    rebuildUi();
  }

  Future<void> _showNoteDialog() async {
    SheetResponse? response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.note,
      barrierDismissible: true,
      enableDrag: true,
      data: ayatNumber,
    );
    if (response != null) _showSnackbar(response.confirmed);
  }

  Future<void> _showSnackbar(bool isNoteSaved) async {
    _snackbarService.showCustomSnackBar(
      title: isNoteSaved ? 'Success!' : 'Error!',
      message: isNoteSaved ? 'Note saved' : 'Unable to save note',
      variant: isNoteSaved ? SnackbarType.success : SnackbarType.error,
    );
  }

  void onSavePdfTap() {}
}
