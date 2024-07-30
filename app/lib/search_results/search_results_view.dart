import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/search_results/search_results_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../global/widgets/ayat_tile.dart';

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
              itemCount: 9,
              itemBuilder: (context, index) {
                return AyatTile(
                  number: index,
                  arabic: 'َﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا',
                  urdu: '-اللہ کے نام سے جو بہت مہربان، رحم کرنے والا ہے',
                  highlightedWord: 'اللہ',
                );
              },
            ),
          ),
        );
      },
    );
  }
}
