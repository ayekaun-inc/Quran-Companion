import 'package:app/global/models/ayat_model.dart';

class AyatListViewArguments {
  final String title;
  final String subtitle;
  final List<AyatModel> ayats;
  final String? highligtedTerm;

  AyatListViewArguments({
    required this.title,
    required this.subtitle,
    required this.ayats,
    this.highligtedTerm,
  });
}
