import 'package:quran_companion/global/models/ayat_list_view_arguments.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/animation_constants.dart';
import 'package:quran_companion/global/widgets/custom_app_bar.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:quran_companion/ayat_list/ayat_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import '../global/widgets/ayat_tile.dart';

class AyatListView extends StatelessWidget {
  final AyatListViewArguments arguments;
  const AyatListView({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAyatListEmpty = arguments.ayats.isEmpty;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AyatListViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: arguments.title,
            subtitle: arguments.subtitle,
          ),
          body: isAyatListEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        ghostAnimation,
                        width: 192.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            'No ayats found! ',
                            size: 15,
                            font: poppinsMedium,
                            color: darkGray,
                          ),
                          InkWell(
                            onTap: viewModel.onTryAgainTap,
                            child: const CustomText(
                              'Try again',
                              size: 15,
                              font: poppinsSemiBold,
                              color: green,
                            ),
                          ),
                        ],
                      ),
                      const VerticalGap(96),
                    ],
                  ),
                )
              : Scrollbar(
                  child: ListView.builder(
                    itemCount: arguments.ayats.length,
                    itemBuilder: (context, index) {
                      return AyatTile(
                        number: arguments.ayats[index].ayatId!,
                        arabic: arguments.ayats[index].arabic ??
                            'Arabic not available!',
                        urdu: arguments.ayats[index].urdu!,
                        highlightedWord: arguments.highligtedTerm,
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
