import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:flutter/material.dart';

/// A custom text widget that allows for optional highlighting of a specific word.
///
/// The `CustomText` widget provides a way to display a string of text with
/// optional highlighting of a particular word. If the [highlightedWord] is
/// present in the [data], it will be highlighted with a different background color.
/// This widget supports custom font, size, color, and text alignment.
///
/// This widget is particularly useful when you need to emphasize a part of the
/// text while maintaining a consistent style across the application.
class CustomText extends StatelessWidget {
  /// The complete text string to display.
  final String data;

  /// The font size of the text.
  final double size;

  /// The font family to use for the text.
  final String font;

  /// The color of the text.
  final Color? color;

  /// An optional word to highlight within the text.
  ///
  /// If [highlightedWord] is present in the [data], it will be highlighted
  /// with a different background color.
  final String? highlightedWord;

  /// The alignment of the text.
  ///
  /// Defaults to [TextAlign.left].
  final TextAlign textAlign;

  /// Creates a `CustomText` widget.
  ///
  /// The [data], [size], and [font] are required. The [color] and [highlightedWord]
  /// are optional. The [textAlign] defaults to [TextAlign.left].
  const CustomText(
    this.data, {
    super.key,
    required this.size,
    required this.font,
    this.color,
    this.highlightedWord,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    // If there is no highlighted word or the highlighted word is not found,
    // return the text as a simple Text widget.
    if (highlightedWord == null || !data.contains(highlightedWord!)) {
      return Text(
        data,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: size.sp,
          fontFamily: font,
          color: color,
        ),
      );
    }

    // Split the text into parts based on the highlighted word.
    final parts = data.split(highlightedWord!);
    final spans = <TextSpan>[];

    // Build a list of TextSpans, with the highlighted word styled differently.
    for (int i = 0; i < parts.length; i++) {
      spans.add(
        TextSpan(
          text: parts[i],
          style: TextStyle(
            fontSize: size.sp,
            fontFamily: font,
            color: color,
          ),
        ),
      );

      // Add the highlighted word between the parts, except after the last part.
      if (i < parts.length - 1) {
        spans.add(
          TextSpan(
            text: highlightedWord,
            style: TextStyle(
              fontSize: size.sp,
              fontFamily: font,
              color: color,
              backgroundColor: green.withOpacity(0.2),
            ),
          ),
        );
      }
    }

    // Return the text as a RichText widget with the appropriate spans.
    return RichText(
      text: TextSpan(children: spans),
      textAlign: textAlign,
    );
  }
}
