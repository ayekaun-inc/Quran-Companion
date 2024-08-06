import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final String font;
  final Color? color;
  final String? highlightedWord;
  final TextAlign textAlign;

  const CustomText(
    this.data, {
    super.key,
    required this.size,
    required this.font,
    this.color,
    this.highlightedWord,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    if (highlightedWord == null || !data.contains(highlightedWord!)) {
      return Text(
        data,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: size.sp,
          fontFamily: font,
          color: color,
        ),
      );
    }

    final parts = data.split(highlightedWord!);
    final spans = <TextSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(
        TextSpan(
          text: parts[i],
          style: TextStyle(
            fontSize: size.sp,
            fontFamily: font,
            color: color,
          ),
        ),
      );

      if (i < parts.length - 1) {
        spans.add(
          TextSpan(
            text: highlightedWord,
            style: TextStyle(
              fontSize: size.sp,
              fontFamily: font,
              color: color,
              backgroundColor: green.withOpacity(0.2),
            ),
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(children: spans),
      textAlign: textAlign,
    );
  }
}
