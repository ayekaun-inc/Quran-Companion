import 'package:flutter/material.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { success, error }

void setupSnackbarUI() {
  final snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: _getConfig(SnackbarType.success),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: _getConfig(SnackbarType.error),
  );
}

SnackbarConfig _getConfig(SnackbarType type) {
  return SnackbarConfig(
    backgroundColor: type == SnackbarType.success ? green : red,
    borderRadius: 8.r,
    dismissDirection: DismissDirection.vertical,
    snackPosition: SnackPosition.TOP,
    animationDuration: Durations.extralong4,
    duration: const Duration(seconds: 3, milliseconds: 600),
    margin: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
    titleTextStyle: TextStyle(
      color: white,
      fontSize: 16.sp,
      fontFamily: poppinsSemiBold,
    ),
    messageTextStyle: TextStyle(
      color: white,
      fontSize: 12.sp,
      fontFamily: poppinsMedium,
    ),
  );
}
