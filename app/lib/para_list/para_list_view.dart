import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/para_list/para_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ParaListView extends StatelessWidget {
  const ParaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ParaListViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(title: 'Read Quran', subtitle: 'By Para'),
          body: const Center(
            child: Text('Para List View'),
          ),
        );
      },
    );
  }
}
