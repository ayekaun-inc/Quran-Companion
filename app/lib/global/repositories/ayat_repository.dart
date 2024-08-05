import 'package:app/global/models/ayat_model.dart';
import 'package:app/global/providers/ayat_provider.dart';

class AyatRepository {
  final AyatProvider _ayatProvider = AyatProvider();

  List<AyatModel> getAyatByUrdu(String searchTerm) {
    return _ayatProvider.getAyatByUrdu(searchTerm);
  }

  List<AyatModel> getAyatBySurah(int surahId) {
    return _ayatProvider.getAyatBySurah(surahId);
  }

  List<AyatModel> getAyatByPara(int paraId) {
    return _ayatProvider.getAyatByPara(paraId);
  }
}
