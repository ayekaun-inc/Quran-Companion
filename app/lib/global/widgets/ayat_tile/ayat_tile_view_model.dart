import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:quran_companion/global/setup/bottom_sheet_setup.dart';
import 'package:quran_companion/global/setup/snackbar_setup.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:share_plus/share_plus.dart';
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

  bool _isSharingPDF = false;
  bool get isSavingPDF => _isSharingPDF;
  void _setIsSavingPDF(bool val) {
    _isSharingPDF = val;
    rebuildUi();
  }

  final int ayatNumber;
  final String arabic;
  final String urdu;
  AyatTileViewModel({
    required this.ayatNumber,
    required this.arabic,
    required this.urdu,
  });

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
        message: response.confirmed ? 'Note saved.' : 'Unable to save note.',
        variant: response.confirmed ? SnackbarType.success : SnackbarType.error,
      );
    }
  }

  Future<pw.Document> _generateAyatPDF() async {
    final pdf = pw.Document();

    final fontData = await rootBundle.load('assets/fonts/amiri_bold.ttf');
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            children: [
              pw.Text(
                'Quran Companion (Ayat #$ayatNumber)',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  arabic,
                  style: pw.TextStyle(
                    fontSize: 20,
                    font: ttf,
                  ),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  urdu,
                  style: pw.TextStyle(
                    fontSize: 18,
                    font: ttf,
                  ),
                  textAlign: pw.TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return pdf;
  }

  Future<File> _savePDFToFile(pw.Document pdf) async {
    final directory = Platform.isIOS
        ? await path_provider.getApplicationDocumentsDirectory()
        : await path_provider.getExternalStorageDirectory();

    final file =
        File('${directory!.path}/Quran-Companion-Ayat#$ayatNumber.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }

  Future<void> _sharePDFFile(File file) async {
    final result = await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'Quran Companion - Ayat#$ayatNumber',
      text: 'Quran Companion - Ayat#$ayatNumber',
    );

    bool sharedSuccessfully = result.status == ShareResultStatus.success;

    _snackbarService.showCustomSnackBar(
      title: sharedSuccessfully ? 'Success!' : 'Error!',
      message: sharedSuccessfully
          ? 'Ayat#$ayatNumber was shared.'
          : 'Unable to share Ayat#$ayatNumber',
      variant: sharedSuccessfully ? SnackbarType.success : SnackbarType.error,
    );
  }

  Future<void> _deletePDFFile(File file) async {
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> onMakeNoteTap() async {
    _setIsMakingNote(true);
    await _showNoteDialog();
    _setIsMakingNote(false);
  }

  Future<void> onSharePDFTap() async {
    _setIsSavingPDF(true);
    try {
      final pdf = await _generateAyatPDF();
      final file = await _savePDFToFile(pdf);
      await _sharePDFFile(file);
      await _deletePDFFile(file);
    } catch (e) {
      _snackbarService.showCustomSnackBar(
        title: 'Error!',
        message: e.toString(),
        variant: SnackbarType.error,
      );
    }
    _setIsSavingPDF(false);
  }
}
