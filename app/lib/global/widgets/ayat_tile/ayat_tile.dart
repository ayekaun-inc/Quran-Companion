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
      viewModelBuilder: () => AyatTileViewModel(
        ayatNumber: number,
        arabic: arabic,
        urdu: urdu,
      ),
      builder: (context, viewModel, child) {
        return HorizontalPadding(
          padding: 27,
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
                    _CustomActionButton(
                      tooltip: 'Make a note',
                      onTap: viewModel.onMakeNoteTap,
                      child: viewModel.isMakingNote
                          ? const _CustomLoadingIndicator()
                          : Center(child: SvgPicture.asset(noteIcon)),
                    ),
                    _CustomActionButton(
                      tooltip: 'Share as PDF',
                      onTap: viewModel.onSharePDFTap,
                      child: SizedBox(
                        width: 21.w,
                        child: viewModel.isSavingPDF
                            ? const _CustomLoadingIndicator()
                            : Icon(
                                Icons.share_outlined,
                                color: green,
                                size: 20.w,
                              ),
                      ),
                    ),
                    const Spacer(),
                    _AyatNumber(number: number),
                    const HorizontalGap(16),
                  ],
                ),
              ),
              const VerticalGap(27),
              _ArabicText(arabic: arabic),
              const VerticalGap(16),
              _UrduText(urdu: urdu, highlightedWord: highlightedWord),
              const VerticalGap(34),
              const CustomDivider(leftGap: 0, rightGap: 0),
            ],
          ),
        );
      },
    );
  }
}

class _AyatNumber extends StatelessWidget {
  const _AyatNumber({
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

class _UrduText extends StatelessWidget {
  const _UrduText({
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

class _ArabicText extends StatelessWidget {
  const _ArabicText({
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

class _CustomActionButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final String? tooltip;
  const _CustomActionButton({
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
        splashColor: green.withOpacity(0.12),
        child: SizedBox(
          width: 30.5.w,
          height: 30.5.h,
          child: child,
        ),
      ),
    );
  }
}

class _CustomLoadingIndicator extends StatelessWidget {
  const _CustomLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 13.5.w,
        height: 13.5.w,
        child: CircularProgressIndicator(
          color: green,
          strokeWidth: 2.w,
        ),
      ),
    );
  }
}
