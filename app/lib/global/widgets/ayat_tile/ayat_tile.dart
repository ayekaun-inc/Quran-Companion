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

/// A widget that displays an Ayat (verse) with various options and translations.
///
/// The `AyatTile` widget includes the Ayat number, Arabic text, Urdu translation,
/// and options for making notes or sharing the Ayat as a PDF. It uses the `AyatTileViewModel`
/// for managing its state and handling user interactions.
class AyatTile extends StatelessWidget {
  /// The Ayat (verse) number.
  final int number;

  /// The Arabic text of the Ayat.
  final String arabic;

  /// The Urdu translation of the Ayat.
  final String urdu;

  /// An optional word in the Urdu text to highlight.
  final String? highlightedWord;

  /// Creates an `AyatTile` widget with the specified properties.
  ///
  /// The [number], [arabic], and [urdu] parameters are required.
  /// The [highlightedWord] is optional and can be used to highlight specific words in the Urdu text.
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
              const CustomDivider(leadingIndent: 0, trailingIndent: 0),
            ],
          ),
        );
      },
    );
  }
}

/// A widget that displays the Ayat number with a styled background.
///
/// This widget is used to visually emphasize the Ayat number within the `AyatTile`.
class _AyatNumber extends StatelessWidget {
  /// The Ayat number to display.
  final int number;

  /// Creates an `_AyatNumber` widget with the specified [number].
  const _AyatNumber({
    required this.number,
  });

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

/// A widget that displays the Urdu translation of the Ayat with optional highlighting.
///
/// This widget is used to render the Urdu translation in the `AyatTile`, with an
/// option to highlight a specific word.
class _UrduText extends StatelessWidget {
  /// The Urdu translation of the Ayat.
  final String urdu;

  /// An optional word to highlight within the Urdu text.
  final String? highlightedWord;

  /// Creates an `_UrduText` widget with the specified [urdu] text and an optional [highlightedWord].
  const _UrduText({
    required this.urdu,
    required this.highlightedWord,
  });

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

/// A widget that displays the Arabic text of the Ayat.
///
/// This widget is used to render the Arabic text in the `AyatTile`, aligning it to the right.
class _ArabicText extends StatelessWidget {
  /// The Arabic text of the Ayat.
  final String arabic;

  /// Creates an `_ArabicText` widget with the specified [arabic] text.
  const _ArabicText({
    required this.arabic,
  });

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

/// A customizable action button used within the `AyatTile`.
///
/// This widget provides an action button with a customizable child widget,
/// tooltip, and tap callback, wrapped in a styled container.
class _CustomActionButton extends StatelessWidget {
  /// The widget displayed inside the button.
  final Widget child;

  /// The callback function triggered when the button is tapped.
  final void Function()? onTap;

  /// An optional tooltip displayed when the user hovers over the button.
  final String? tooltip;

  /// Creates a `_CustomActionButton` widget with the specified [child], [onTap] callback, and an optional [tooltip].
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

/// A custom loading indicator used within action buttons in the `AyatTile`.
///
/// This widget provides a small circular progress indicator, styled to match the app's theme.
class _CustomLoadingIndicator extends StatelessWidget {
  /// Creates a `_CustomLoadingIndicator` widget.
  const _CustomLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 13.5.w,
        height: 13.5.h,
        child: CircularProgressIndicator(
          color: green,
          strokeWidth: 2.w,
        ),
      ),
    );
  }
}
