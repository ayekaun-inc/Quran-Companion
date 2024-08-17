import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/widgets/horizontal_gap.dart';
import 'package:flutter/material.dart';

/// A customizable horizontal divider with leading and trailing indents.
///
/// The `CustomDivider` widget creates a horizontal line (divider) with
/// configurable leading and trailing indents. The divider is styled with
/// a specific color and height, and the indents are controlled using
/// [HorizontalGap] widgets.
///
/// This widget is useful for creating visual separations in the UI, where
/// the divider does not span the full width of the container.
class CustomDivider extends StatelessWidget {
  /// The amount of horizontal space before the divider starts.
  final double leadingIndent;

  /// The amount of horizontal space after the divider ends.
  final double trailingIndent;

  /// Creates a `CustomDivider` widget with specified [leadingIndent] and [trailingIndent].
  ///
  /// The [leadingIndent] and [trailingIndent] parameters control the padding
  /// on either side of the divider, allowing for precise alignment within
  /// the layout.
  const CustomDivider({
    super.key,
    required this.leadingIndent,
    required this.trailingIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HorizontalGap(leadingIndent),
        Expanded(
          child: Container(
            height: 1,
            color: green.withOpacity(0.2),
          ),
        ),
        HorizontalGap(trailingIndent),
      ],
    );
  }
}
