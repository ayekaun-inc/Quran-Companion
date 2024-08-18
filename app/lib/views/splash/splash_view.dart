import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/svg_constants.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:quran_companion/splash/splash_view_model.dart';
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
            child: AnimatedOpacity(
              opacity: viewModel.opacity,
              duration: const Duration(milliseconds: 666),
              child: Column(
                children: [
                  const Flexible(child: Align(child: SizedBox.shrink())),
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
                  Flexible(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            'Version ${viewModel.appVersion}',
                            size: 14,
                            font: poppinsMedium,
                            color: brown.withOpacity(0.4),
                          ),
                          const VerticalGap(33),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
