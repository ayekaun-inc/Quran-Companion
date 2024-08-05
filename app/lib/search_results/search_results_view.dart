import 'package:app/global/models/search_results_view_arguments.dart';
import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/utils/animation_constants.dart';
import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/global/widgets/custom_text.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:app/search_results/search_results_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import '../global/widgets/ayat_tile.dart';

class SearchResultsView extends StatelessWidget {
  final SearchResultsViewArguments arguments;
  const SearchResultsView({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSearchEmpty = arguments.searchResults.isEmpty;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SearchResultsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Search Results',
            subtitle: "by word '${arguments.searchTerm}'",
          ),
          body: isSearchEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        ghostAnimation,
                        width: 192.w,
                      ),
                      const CustomText(
                        'No results found! Try again',
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
                    itemCount: arguments.searchResults.length,
                    itemBuilder: (context, index) {
                      return AyatTile(
                        number: index,
                        arabic: arguments.searchResults[index].arabic ??
                            'Arabic not available!',
                        urdu: arguments.searchResults[index].urdu!,
                        highlightedWord: arguments.searchTerm,
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
