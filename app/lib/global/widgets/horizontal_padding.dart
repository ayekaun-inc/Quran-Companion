import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:flutter/material.dart';

class HorizontalPadding extends StatelessWidget {
  final double padding;
  final Widget child;
  const HorizontalPadding({
    super.key,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: child,
    );
  }
}
