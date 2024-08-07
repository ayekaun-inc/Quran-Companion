import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final String? tooltip;
  const CustomActionButton({
    super.key,
    required this.child,
    required this.onTap,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        splashColor: green.withOpacity(0.1),
        child: SizedBox(
          width: 30.5.w,
          height: 30.5.h,
          child: child,
        ),
      ),
    );
  }
}
