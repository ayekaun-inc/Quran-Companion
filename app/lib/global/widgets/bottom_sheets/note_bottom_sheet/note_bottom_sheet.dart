import 'package:flutter/material.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_padding.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:stacked_services/stacked_services.dart';

class NoteBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final void Function(SheetResponse<void>) completer;
  const NoteBottomSheet({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.h,
      width: double.maxFinite,
      decoration: ShapeDecoration(
        color: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
      ),
      child: HorizontalPadding(
        padding: 24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalGap(16),
            Center(
              child: Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: green.withOpacity(0.369),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
            const VerticalGap(32),
            CustomText(
              'Make a note',
              size: 14,
              font: poppinsMedium,
            ),
          ],
        ),
      ),
    );
  }
}
