import 'package:quran_companion/global/models/ayat_model.dart';
import 'package:quran_companion/global/utils/enums.dart';
import 'package:quran_companion/global/utils/quran.dart';

class AyatProvider {
  List<AyatModel> getAyatByUrdu(String searchTerm) {
    return quran
        .where(
          (ayat) => ayat['urdu'] != null && ayat['urdu'].contains(searchTerm),
        )
        .map((ayat) => AyatModel.fromJson(ayat))
        .toList();
  }

  List<AyatModel> getAyatBySurahPara(ReadingMode mode, int id) {
    return quran
        .where((ayat) =>
            ayat[mode == ReadingMode.surah ? 'surah_id' : 'para_id'] == id)
        .map((ayat) => AyatModel.fromJson(ayat))
        .toList();
  }
}
