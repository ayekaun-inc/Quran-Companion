import 'package:app/global/themes/colors.dart';
import 'package:app/global/widgets/horizontal_gap.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double leftGap;
  final double rightGap;
  const CustomDivider({
    super.key,
    required this.leftGap,
    required this.rightGap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HorizontalGap(leftGap),
        Expanded(
          child: Container(
            height: 1,
            color: green.withOpacity(0.2),
          ),
        ),
        HorizontalGap(rightGap),
      ],
    );
  }
}
