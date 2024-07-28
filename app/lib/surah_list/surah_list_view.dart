import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/surah_list/surah_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../global/widgets/surah_para_tile.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SurahListViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(title: 'Read Quran', subtitle: 'By Surah'),
          body: Scrollbar(
            child: ListView.builder(
              itemCount: 114,
              itemBuilder: (context, index) {
                return SurahParaTile(
                  number: index + 1,
                  title: 'Al-Baqarah',
                  subtitle: '286 Verses',
                  arabic: 'ةرقبلا',
                  onTap: () {},
                );
              },
            ),
          ),
        );
      },
    );
  }
}
