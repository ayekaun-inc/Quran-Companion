import 'package:quran_companion/global/utils/enums.dart';
import 'package:quran_companion/global/widgets/custom_app_bar.dart';
import 'package:quran_companion/views/surah_para_list/surah_para_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'widgets/surah_para_tile.dart';

class SurahParaListView extends StatelessWidget {
  final ReadingMode mode;
  const SurahParaListView({
    super.key,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SurahParaListViewModel(mode),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Read Quran',
            subtitle: 'by ${mode.type}',
          ),
          body: Scrollbar(
            child: ListView.builder(
              itemCount: viewModel.surahParaList.length,
              itemBuilder: (context, index) {
                return SurahParaTile(
                  number: index + 1,
                  title: viewModel.surahParaList[index].titleEnglish,
                  subtitle:
                      '${viewModel.surahParaList[index].verseCount} VERSES',
                  arabic: viewModel.surahParaList[index].titleArabic,
                  onTap: () => viewModel.onTileTap(
                    index,
                    viewModel.surahParaList[index].titleEnglish,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
