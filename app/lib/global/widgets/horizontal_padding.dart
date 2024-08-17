import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:flutter/material.dart';

/// A widget that provides horizontal padding around its child widget.
///
/// The `HorizontalPadding` widget is a convenience wrapper around [Padding],
/// applying symmetrical horizontal padding to its [child] using the `.w`
/// extension for responsive sizing. This widget is useful for adding
/// consistent horizontal padding across various parts of your UI,
/// particularly in a responsive design context.
class HorizontalPadding extends StatelessWidget {
  /// The amount of horizontal padding in logical pixels.
  final double padding;

  /// The child widget to which the padding will be applied.
  final Widget child;

  /// Creates a `HorizontalPadding` widget with the specified [padding] and [child].
  ///
  /// The [padding] parameter defines the horizontal space to apply on both
  /// sides of the [child]. The [child] parameter is required as it represents
  /// the widget to which the padding will be applied.
  const HorizontalPadding({
    super.key,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: child,
    );
  }
}
