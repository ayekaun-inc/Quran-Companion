import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/setup/snackbar_setup.dart';
import 'package:quran_companion/global/utils/routes.dart';
import 'package:quran_companion/global/themes/light_theme/light_theme.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    locator<SizeHelperService>().init(context);
    setupSnackbarUI();
    return MaterialApp(
      title: 'Quran Companion',
      theme: LightTheme.theme,
      initialRoute: splashView,
      onGenerateRoute: RoutesPath.generateRoute,
      navigatorKey: StackedService.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
