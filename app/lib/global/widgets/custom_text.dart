import 'package:app/global/services/size_helper_service.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final String font;
  final Color? color;
  const CustomText(
    this.data, {
    super.key,
    required this.size,
    required this.font,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: size.sp,
        fontFamily: font,
        color: color,
      ),
    );
  }
}
