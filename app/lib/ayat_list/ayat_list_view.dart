import 'package:app/global/models/ayat_list_view_arguments.dart';
import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/utils/animation_constants.dart';
import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:app/ayat_list/ayat_list_view_model.dart';
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
                      const CustomText(
                        'No ayats found! Try again',
                        size: 15,
                        font: poppinsRegular,
                        color: darkGray,
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
