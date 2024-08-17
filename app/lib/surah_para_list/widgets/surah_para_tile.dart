import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/svg_constants.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_gap.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../global/widgets/custom_divider.dart';

/// A widget that represents a tile displaying a Surah or Para in the Quran.
///
/// The `SurahParaTile` widget provides a standardized way to display a Surah or Para
/// in a list, including its number, title, subtitle, and Arabic name. It also includes
/// a decorative star icon with the Surah/Para number at the center.
///
/// The tile is tappable, triggering the provided [onTap] callback when pressed.
class SurahParaTile extends StatelessWidget {
  /// The number of the Surah or Para.
  final int number;

  /// The English title of the Surah or Para.
  final String title;

  /// The subtitle providing additional information, such as the number of verses.
  final String subtitle;

  /// The Arabic name of the Surah or Para.
  final String arabic;

  /// The callback function triggered when the tile is tapped.
  final void Function()? onTap;

  /// Creates a `SurahParaTile` widget with the specified properties.
  ///
  /// The [number], [title], [subtitle], and [arabic] are required.
  /// The [onTap] callback is optional and can be used to handle tile tap events.
  const SurahParaTile({
    super.key,
    required this.number,
    required this.title,
    required this.arabic,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          // Add a divider between tiles, except for the first tile.
          if (number != 1) ...[
            const CustomDivider(leadingIndent: 20, trailingIndent: 24),
          ],
          SizedBox(
            width: double.maxFinite,
            height: 78.h,
            child: Row(
              children: [
                const HorizontalGap(24),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      starIcon,
                      width: 36.w,
                    ),
                    CustomText(
                      number.toString(),
                      size: 12,
                      font: poppinsMedium,
                      color: brown,
                    ),
                  ],
                ),
                const HorizontalGap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title,
                      size: 16,
                      font: poppinsMedium,
                      color: brown,
                    ),
                    const VerticalGap(4),
                    Row(
                      children: [
                        Container(
                          width: 4.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: green.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const HorizontalGap(5),
                        CustomText(
                          subtitle.toUpperCase(),
                          size: 12,
                          font: poppinsMedium,
                          color: brown.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                CustomText(
                  arabic,
                  size: 16,
                  font: amiriBold,
                  color: green,
                ),
                const HorizontalGap(36),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
