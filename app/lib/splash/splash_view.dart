import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/utils/svg_constants.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:app/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  appIcon,
                  width: 135.w,
                ),
                const VerticalGap(18.5),
                const CustomText(
                  'The Quran Companion',
                  size: 23,
                  font: poppinsMedium,
                  color: brown,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
