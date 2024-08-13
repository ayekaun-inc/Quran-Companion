import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_companion/global/setup/bottom_sheet_setup.dart';
import 'package:quran_companion/global/setup/snackbar_setup.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pdf/widgets.dart' as pw;

class AyatTileViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool _isMakingNote = false;
  bool get isMakingNote => _isMakingNote;
  void _setIsMakingNote(bool val) {
    _isMakingNote = val;
    rebuildUi();
  }

  bool _isSavingPDF = false;
  bool get isSavingPDF => _isSavingPDF;
  void _setIsSavingPDF(bool val) {
    _isSavingPDF = val;
    rebuildUi();
  }

  final int ayatNumber;
  AyatTileViewModel({required this.ayatNumber});

  Future<void> onMakeNoteTap() async {
    _setIsMakingNote(true);
    await _showNoteDialog();
    _setIsMakingNote(false);
  }

  Future<void> _showNoteDialog() async {
    SheetResponse? response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.note,
      barrierDismissible: true,
      enableDrag: true,
      data: ayatNumber,
    );
    if (response != null) {
      _snackbarService.showCustomSnackBar(
        title: response.confirmed ? 'Success!' : 'Error!',
        message: response.confirmed ? 'Note saved' : 'Unable to save note',
        variant: response.confirmed ? SnackbarType.success : SnackbarType.error,
      );
    }
  }

  Future<void> onSavePdfTap() async {
    _setIsSavingPDF(true);
    bool storagePermissionGranted = await _hasStoragePermission();
    if (storagePermissionGranted) {
      await _saveAyatDetailsAsPDF();
    }
    _setIsSavingPDF(false);
  }

  Future<void> _saveAyatDetailsAsPDF() async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(
            child: pw.Text('content'),
          ),
        ),
      );

      final directory = await path_provider.getApplicationDocumentsDirectory();
      final file = File('${directory.path}/qc_$ayatNumber.pdf');

      await file.writeAsBytes(await pdf.save());

      _snackbarService.showCustomSnackBar(
        message: 'message',
        variant: SnackbarType.success,
      );
    } catch (e) {
      print(e);
      _snackbarService.showCustomSnackBar(
        message: e.toString(),
        variant: SnackbarType.error,
      );
    }
  }

  Future<bool> _hasStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }
}
