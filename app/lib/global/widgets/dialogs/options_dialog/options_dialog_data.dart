import 'package:flutter/material.dart';

class OptionsDialogData {
  final String option1;
  final String option2;
  final VoidCallback? onOption1Pressed;
  final VoidCallback? onOption2Pressed;

  OptionsDialogData({
    required this.option1,
    required this.option2,
    required this.onOption1Pressed,
    required this.onOption2Pressed,
  });
}
