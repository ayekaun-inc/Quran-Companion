import 'package:flutter/material.dart';

class HorizontalGap extends StatelessWidget {
  final double width;
  const HorizontalGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
