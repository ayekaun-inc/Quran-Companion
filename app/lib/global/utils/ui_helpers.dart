import 'package:app/global/themes/colors.dart';
import 'package:flutter/services.dart';

void setStatusBarTransparent() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
