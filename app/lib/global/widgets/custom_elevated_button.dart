import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// A customizable elevated button with responsive sizing and text styling.
///
/// The `CustomElevatedButton` widget provides a button with customizable
/// dimensions, color, and label. The button's size is responsive to the
/// screen dimensions, and the label is styled using a specified font and size.
///
/// This widget is ideal for creating buttons that fit within a consistent
/// design system while allowing flexibility in appearance.
class CustomElevatedButton extends StatelessWidget {
  /// The text label displayed on the button.
  final String label;

  /// The font size of the label text.
  final double labelSize;

  /// The callback function triggered when the button is pressed.
  final void Function()? onPressed;

  /// The background color of the button.
  final Color color;

  /// The height of the button in logical pixels.
  final num height;

  /// The width of the button in logical pixels.
  final num width;

  /// Creates a `CustomElevatedButton` widget with the specified properties.
  ///
  /// The [label], [onPressed], [labelSize], [height], [width], and [color]
  /// parameters can be customized to adjust the appearance and behavior of
  /// the button. The [labelSize], [height], [width], and [color] have default
  /// values, allowing you to create a button with minimal configuration.
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelSize = 15,
    this.height = 39,
    this.width = double.maxFinite,
    this.color = green,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          foregroundColor: MaterialStateProperty.all<Color>(white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: CustomText(label, size: labelSize, font: poppinsMedium),
      ),
    );
  }
}
