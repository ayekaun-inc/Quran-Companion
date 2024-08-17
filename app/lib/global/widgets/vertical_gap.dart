import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:flutter/material.dart';

/// A widget that provides vertical spacing between other widgets.
///
/// The `VerticalGap` widget is a simple wrapper around [SizedBox]
/// that adds vertical space based on the given [height]. The height
/// is provided in logical pixels and converted to the appropriate
/// responsive height using the `.h` extension.
///
/// This widget is useful for adding consistent vertical spacing
/// in layouts, especially when using responsive design principles.
class VerticalGap extends StatelessWidget {
  /// The height of the gap in logical pixels.
  final double height;

  /// Creates a `VerticalGap` widget with the specified [height].
  ///
  /// The [height] parameter defines the vertical space this widget
  /// will occupy in logical pixels.
  const VerticalGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
