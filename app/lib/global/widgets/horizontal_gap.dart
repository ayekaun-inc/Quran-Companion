import 'package:flutter/material.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';

class HorizontalGap extends StatelessWidget {
  final double width;
  const HorizontalGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}
