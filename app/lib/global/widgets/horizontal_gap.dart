import 'package:flutter/material.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';

/// A widget that provides horizontal spacing between other widgets.
///
/// The `HorizontalGap` widget is a simple wrapper around [SizedBox]
/// that adds horizontal space based on the given [width]. The width
/// is provided in logical pixels and converted to the appropriate
/// responsive width using the `.w` extension.
///
/// This widget is useful for adding consistent horizontal spacing
/// in layouts, especially when using responsive design principles.
class HorizontalGap extends StatelessWidget {
  /// The width of the gap in logical pixels.
  final double width;

  /// Creates a `HorizontalGap` widget with the specified [width].
  ///
  /// The [width] parameter defines the horizontal space this widget
  /// will occupy in logical pixels.
  const HorizontalGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}
