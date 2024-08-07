import 'package:flutter_svg/svg.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/svg_constants.dart';
import 'package:quran_companion/global/widgets/ayat_tile/ayat_tile_view_model.dart';
import 'package:quran_companion/global/widgets/custom_divider.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_gap.dart';
import 'package:quran_companion/global/widgets/horizontal_padding.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../custom_action_button.dart';

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
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AyatTileViewModel(),
      builder: (context, viewModel, child) {
        return HorizontalPadding(
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
                    CustomActionButton(
                      tooltip: 'Make a note',
                      onTap: viewModel.onMakeNoteTap,
                      child: Center(
                        child: SvgPicture.asset(
                          noteIcon,
                        ),
                      ),
                    ),
                    CustomActionButton(
                      tooltip: 'Save as PDF',
                      onTap: () {},
                      child: SizedBox(
                        width: 21.w,
                        child: const Icon(
                          Icons.save_alt_rounded,
                          color: green,
                        ),
                      ),
                    ),
                    const Spacer(),
                    AyatNumber(number: number),
                    const HorizontalGap(16),
                  ],
                ),
              ),
              const VerticalGap(27),
              ArabicText(arabic: arabic),
              const VerticalGap(16),
              UrduText(urdu: urdu, highlightedWord: highlightedWord),
              const VerticalGap(34),
              const CustomDivider(leftGap: 0, rightGap: 0),
            ],
          ),
        );
      },
    );
  }
}

class AyatNumber extends StatelessWidget {
  const AyatNumber({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Ayat number',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: green.withOpacity(0.81),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 3.h,
        ),
        child: CustomText(
          number.toString(),
          size: 12,
          font: poppinsMedium,
          color: white,
        ),
      ),
    );
  }
}

class UrduText extends StatelessWidget {
  const UrduText({
    super.key,
    required this.urdu,
    required this.highlightedWord,
  });

  final String urdu;
  final String? highlightedWord;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomText(
        urdu,
        size: 16,
        font: amiriRegular,
        color: brown,
        textAlign: TextAlign.right,
        highlightedWord: highlightedWord,
      ),
    );
  }
}

class ArabicText extends StatelessWidget {
  const ArabicText({
    super.key,
    required this.arabic,
  });

  final String arabic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomText(
        arabic,
        size: 18,
        font: amiriBold,
        color: brown,
        textAlign: TextAlign.right,
      ),
    );
  }
}
