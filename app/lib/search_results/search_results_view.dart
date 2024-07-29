import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/utils/svg_constants.dart';
import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/global/widgets/custom_divider.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/horizontal_gap.dart';
import 'package:app/global/widgets/horizontal_padding.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:app/search_results/search_results_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SearchResultsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Search Results',
            subtitle: "by word 'اللہ'",
          ),
          body: Scrollbar(
            child: ListView.builder(
              itemCount: 63,
              itemBuilder: (context, index) {
                return AyatTile();
              },
            ),
          ),
        );
      },
    );
  }
}

class AyatTile extends StatelessWidget {
  const AyatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: HorizontalPadding(
        padding: 27.w,
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
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 30.5.w,
                      height: double.maxFinite,
                      child: Center(
                        child: SvgPicture.asset(
                          editIcon,
                          width: 17.w,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 30.5.w,
                      height: double.maxFinite,
                      child: Center(
                        child: Icon(
                          Icons.save_alt_rounded,
                          color: green,
                          size: 21.w,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: green,
                    foregroundColor: white,
                    radius: 13.5.r,
                    child: const CustomText('1', size: 14, font: poppinsMedium),
                  ),
                  const HorizontalGap(16),
                ],
              ),
            ),
            const VerticalGap(27),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  'َﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا',
                  size: 18,
                  font: amiriBold,
                  color: brown,
                ),
              ],
            ),
            const VerticalGap(16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  'اللہ کے نام سے جو بہت مہربان، رحم کرنے والا ہے-',
                  size: 16,
                  font: amiriRegular,
                  color: brown,
                ),
              ],
            ),
            const VerticalGap(34),
            const CustomDivider(leftGap: 0, rightGap: 0),
          ],
        ),
      ),
    );
  }
}
