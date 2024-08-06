import 'package:quran_companion/global/models/ayat_model.dart';
import 'package:quran_companion/global/providers/ayat_provider.dart';
import 'package:quran_companion/global/utils/enums.dart';

class AyatRepository {
  final AyatProvider _ayatProvider = AyatProvider();

  List<AyatModel> getAyatByUrdu(String searchTerm) {
    return _ayatProvider.getAyatByUrdu(searchTerm);
  }

  List<AyatModel> getAyatBySurahPara(ReadingMode mode, int id) {
    return _ayatProvider.getAyatBySurahPara(mode, id);
  }
}
