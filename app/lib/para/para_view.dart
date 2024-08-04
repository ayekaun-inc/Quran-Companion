import 'package:app/global/widgets/ayat_tile.dart';
import 'package:app/global/widgets/custom_app_bar.dart';
import 'package:app/para/para_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ParaView extends StatelessWidget {
  const ParaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ParaViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(title: 'Para', subtitle: 'Alif Laam Meem'),
          body: Scrollbar(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return AyatTile(
                  number: index,
                  arabic: 'مَـٰلِكِ يَوْمِ ٱلدِّينِ',
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
