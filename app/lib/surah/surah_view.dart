import 'package:app/global/widgets/ayat_tile.dart';
import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/surah/surah_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SurahViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Surah',
            subtitle: 'Al-Fatiah',
          ),
          body: Scrollbar(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return AyatTile(
                  number: index,
                  arabic: 'َﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا',
                  urdu: '-اللہ کے نام سے جو بہت مہربان، رحم کرنے والا ہے',
                );
              },
            ),
          ),
        );
      },
    );
  }
}
