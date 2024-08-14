import 'package:flutter_svg/svg.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/svg_constants.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_padding.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:quran_companion/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../global/widgets/custom_elevated_button.dart';
import 'widgets/search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: HorizontalPadding(
                  padding: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalGap(13.5),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          'The Quran Companion',
                          size: 15,
                          font: poppinsSemiBold,
                          color: brown,
                        ),
                      ),
                      const VerticalGap(13.5),
                      const Align(
                        alignment: Alignment.center,
                        child: _CachedHomeBanner(),
                      ),
                      const VerticalGap(15),
                      const CustomText(
                        'Search for particular words in the verses',
                        size: 15,
                        font: poppinsMedium,
                        color: brown,
                      ),
                      const VerticalGap(15),
                      SearchTextField(
                        onChanged: viewModel.onSearchTextChanged,
                        onSubmitted: viewModel.onSearchTextSubmitted,
                      ),
                      const VerticalGap(15),
                      CustomElevatedButton(
                        label: viewModel.isSearching ? 'Searching' : 'Search',
                        onPressed: viewModel.searchIsEmptyError ||
                                viewModel.isSearching
                            ? null
                            : viewModel.onSearchPress,
                        color: viewModel.searchIsEmptyError ||
                                viewModel.isSearching
                            ? darkGray
                            : green,
                      ),
                      const VerticalGap(45),
                      const CustomText(
                        'Read Quran',
                        size: 15,
                        font: poppinsMedium,
                        color: brown,
                      ),
                      const VerticalGap(15),
                      CustomElevatedButton(
                        label: 'Tap to choose a mode',
                        onPressed: viewModel.onReadQuranPressed,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CachedHomeBanner extends StatelessWidget {
  const _CachedHomeBanner();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width.w - 63.w,
          height: MediaQuery.sizeOf(context).width.w - 63.w,
          decoration: BoxDecoration(
            color: purple,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SvgPicture.asset(
            homeBanner,
            width: MediaQuery.sizeOf(context).width.w - 63.w,
          ),
        ),
      ],
    );
  }
}
