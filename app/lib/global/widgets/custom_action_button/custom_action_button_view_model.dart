import 'package:app/global/utils/enums.dart';
import 'package:app/global/utils/keys.dart';
import 'package:app/global/setup/local_storage_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class CustomActionButtonViewModel extends BaseViewModel {
  Future<void> onActionButtonTap({required CustomActionButtonType type}) async {
    setBusy(true);
    if (type == CustomActionButtonType.note) {
      await showNoteBottomSheet();
    } else {
      await downloadAyatAsPdf();
    }
    await Future.delayed(const Duration(seconds: 3));
    setBusy(false);
  }

  Future<void> showNoteBottomSheet() async {
    // TODO: show note bottom sheet
    SharedPreferences sp = LocalStorage.preferences!;
    await sp.setString('${noteKeyPrefix}1', 'omalord');
  }

  Future<void> downloadAyatAsPdf() async {
    // TODO: implement download logic
  }
}
