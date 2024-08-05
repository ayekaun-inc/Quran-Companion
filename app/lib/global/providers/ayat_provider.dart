import 'package:app/global/models/ayat_model.dart';
import 'package:app/global/utils/quran.dart';

class AyatProvider {
  List<AyatModel> getAyatByUrdu(String searchTerm) {
    return quran
        .where(
          (ayat) => ayat['urdu'] != null && ayat['urdu'].contains(searchTerm),
        )
        .map((ayat) => AyatModel.fromJson(ayat))
        .toList();
  }

  List<AyatModel> getAyatBySurah(int surahId) {
    return quran
        .where((ayat) => ayat['surah_id'] == surahId)
        .map((ayat) => AyatModel.fromJson(ayat))
        .toList();
  }

  List<AyatModel> getAyatByPara(int paraId) {
    return quran
        .where((ayat) => ayat['para_id'] == paraId)
        .map((ayat) => AyatModel.fromJson(ayat))
        .toList();
  }
}
