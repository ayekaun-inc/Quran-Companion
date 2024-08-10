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

void collapseKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
