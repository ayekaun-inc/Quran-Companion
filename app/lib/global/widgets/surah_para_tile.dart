import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/utils/svg_constants.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/horizontal_gap.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurahParaTile extends StatelessWidget {
  final int number;
  final String title;
  final String? subtitle;
  final String arabic;
  final void Function()? onTap;
  const SurahParaTile({
    super.key,
    required this.number,
    required this.title,
    required this.arabic,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          if (number != 1) ...[
            Row(
              children: [
                const HorizontalGap(20),
                Expanded(
                  child: Container(
                    height: 1,
                    color: green.withOpacity(0.2),
                  ),
                ),
                const HorizontalGap(24),
              ],
            ),
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
                      size: 14,
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
                    if (subtitle != null) ...[
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
                            subtitle!.toUpperCase(),
                            size: 12,
                            font: poppinsMedium,
                            color: brown.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
                const Spacer(),
                CustomText(
                  arabic,
                  size: 20,
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
