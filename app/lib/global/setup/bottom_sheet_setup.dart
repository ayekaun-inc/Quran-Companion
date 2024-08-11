import 'package:quran_companion/global/widgets/bottom_sheets/note_bottom_sheet/note_bottom_sheet.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum BottomSheetType { note }

void setupBottomSheetUI() {
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.note: (context, sheetRequest, completer) {
      return NoteBottomSheet(request: sheetRequest, completer: completer);
    },
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
