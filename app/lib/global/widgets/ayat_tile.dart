import 'package:app/global/enums.dart';
import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/widgets/custom_divider.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/horizontal_gap.dart';
import 'package:app/global/widgets/horizontal_padding.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';

import 'custom_action_button/custom_action_button.dart';

class AyatTile extends StatelessWidget {
  final int number;
  final String arabic;
  final String urdu;
  final String? highlightedWord;
  const AyatTile({
    super.key,
    required this.number,
    required this.arabic,
    required this.urdu,
    this.highlightedWord,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: HorizontalPadding(
        padding: 27.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalGap(20),
            Container(
              width: 318.w,
              height: 47.h,
              decoration: BoxDecoration(
                color: green.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  const HorizontalGap(8.25),
                  const CustomActionButton(type: CustomActionButtonType.note),
                  const CustomActionButton(
                      type: CustomActionButtonType.download),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: green,
                    foregroundColor: white,
                    radius: 13.5.r,
                    child: CustomText(
                      number.toString(),
                      size: 14,
                      font: poppinsMedium,
                    ),
                  ),
                  const HorizontalGap(16),
                ],
              ),
            ),
            const VerticalGap(27),
            SizedBox(
              width: double.maxFinite,
              child: CustomText(
                arabic,
                size: 18,
                font: amiriBold,
                color: brown,
                textAlign: TextAlign.right,
              ),
            ),
            const VerticalGap(16),
            SizedBox(
              width: double.maxFinite,
              child: CustomText(
                urdu,
                size: 16,
                font: amiriRegular,
                color: brown,
                textAlign: TextAlign.right,
                highlightedWord: highlightedWord,
              ),
            ),
            const VerticalGap(34),
            const CustomDivider(leftGap: 0, rightGap: 0),
          ],
        ),
      ),
    );
  }
}
