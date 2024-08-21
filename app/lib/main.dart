import 'package:quran_companion/global/setup/bottom_sheet_setup.dart';
import 'package:quran_companion/global/setup/dialog_setup.dart';
import 'package:quran_companion/global/setup/local_storage_setup.dart';
import 'package:quran_companion/global/utils/ui_helpers.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:flutter/material.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  setSystemOverlayStyle();
  await lockAppOrientation();
  setupDialogUI();
  setupBottomSheetUI();
  await LocalStorage.initializeSharedPreferences();
  runApp(const App());
}
