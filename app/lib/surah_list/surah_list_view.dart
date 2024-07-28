import 'package:app/surah_list/surah_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SurahListViewModel(),
      builder: (context, viewModel, child) {
        return const Scaffold(
          body: Center(
            child: Text('Surah List View'),
          ),
        );
      },
    );
  }
}
