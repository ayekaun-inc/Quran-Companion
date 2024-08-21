import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_companion/global/themes/colors.dart';

void setSystemOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: transparent,
      systemNavigationBarDividerColor: transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

Future<void> lockAppOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void collapseKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

Future<void> simulateLoading({
  Duration duration = const Duration(seconds: 3),
}) async {
  await Future.delayed(duration);
}
