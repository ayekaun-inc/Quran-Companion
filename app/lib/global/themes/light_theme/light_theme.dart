import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: white,
        scrollbarTheme: ScrollbarThemeData(
          radius: Radius.circular(16.r),
          thickness: MaterialStateProperty.all<double>(4.w),
          thumbColor: MaterialStateProperty.all<Color>(green),
          trackColor: MaterialStateProperty.all<Color>(green.withOpacity(0.2)),
        ),
      );
}
