import 'package:quran_companion/global/models/ayat_model.dart';

class AyatListViewArgumentsModel {
  final String title;
  final String subtitle;
  final List<AyatModel> ayats;
  final String? highligtedTerm;

  AyatListViewArgumentsModel({
    required this.title,
    required this.subtitle,
    required this.ayats,
    this.highligtedTerm,
  });
}
