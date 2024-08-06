import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  final double height;
  const VerticalGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
