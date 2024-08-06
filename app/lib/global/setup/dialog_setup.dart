import 'package:quran_companion/global/widgets/dialogs/options_dialog/options_dialog.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { options }

void setupDialogUI() {
  final DialogService dialogService = locator<DialogService>();

  final builders = {
    DialogType.options: (context, sheetRequest, completer) {
      return OptionsDialog(
        request: sheetRequest,
        completer: completer,
      );
    },
  };

  dialogService.registerCustomDialogBuilders(builders);
}
