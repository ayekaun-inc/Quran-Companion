import 'package:app/global/enums.dart';
import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/utils/svg_constants.dart';
import 'package:app/global/widgets/custom_divider.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/horizontal_gap.dart';
import 'package:app/global/widgets/horizontal_padding.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            AyatTileHeader(number: number),
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

class AyatTileHeader extends StatelessWidget {
  const AyatTileHeader({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 47.h,
      decoration: BoxDecoration(
        color: green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          const HorizontalGap(8.25),
          const AyatTileActionButton(type: AyatTileActionButtonType.note),
          const AyatTileActionButton(type: AyatTileActionButtonType.download),
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
    );
  }
}

class AyatTileActionButton extends StatelessWidget {
  final AyatTileActionButtonType type;
  const AyatTileActionButton({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10.r),
      splashColor: green.withOpacity(0.1),
      child: SizedBox(
        width: 30.5.w,
        height: 30.5.h,
        child: Center(
          child: type == AyatTileActionButtonType.note
              ? SvgPicture.asset(
                  noteIcon,
                  width: 17.w,
                )
              : Icon(
                  Icons.save_alt_rounded,
                  color: green,
                  size: 21.w,
                ),
        ),
      ),
    );
  }
}
