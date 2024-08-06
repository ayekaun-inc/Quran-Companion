import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/svg_constants.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_gap.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  final String title;
  final String subtitle;
  CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: shadow.withOpacity(0.2),
              offset: Offset(0, 8.h),
              blurRadius: 16.r,
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 8.w),
        child: Row(
          children: [
            IconButton(
              onPressed: _navigationService.back,
              icon: SvgPicture.asset(
                backIcon,
                width: 21.w,
              ),
            ),
            const HorizontalGap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title,
                  size: 16,
                  font: poppinsSemiBold,
                  color: green,
                ),
                CustomText(
                  subtitle,
                  size: 14,
                  font: poppinsMediumItalic,
                  color: brown,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}
