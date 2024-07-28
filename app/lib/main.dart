import 'package:app/global/setup/dialog_setup.dart';
import 'package:app/global/setup/local_storage_setup.dart';
import 'package:app/global/utils/ui_helpers.dart';
import 'package:app/services_locator.dart';
import 'package:flutter/material.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreferences();
  await setUpServiceLocator();
  setupDialogUI();
  setStatusBarTransparent();
  runApp(const App());
}
