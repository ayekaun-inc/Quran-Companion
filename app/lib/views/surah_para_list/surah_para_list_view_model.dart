import 'package:quran_companion/global/models/ayat_list_view_arguments.dart';
import 'package:quran_companion/global/models/ayat_model.dart';
import 'package:quran_companion/views/surah_para_list/models/surah_para_tile_model.dart';
import 'package:quran_companion/global/repositories/ayat_repository.dart';
import 'package:quran_companion/global/utils/enums.dart';
import 'package:quran_companion/global/utils/quran.dart';
import 'package:quran_companion/global/utils/routes.dart';
import 'package:quran_companion/global/utils/surah_para_arabic_names.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SurahParaListViewModel extends BaseViewModel {
  late List<SurahParaTileModel> _surahParaList;
  List<SurahParaTileModel> get surahParaList => _surahParaList;
  final NavigationService _navigationService = locator<NavigationService>();
  final AyatRepository _ayatRepository = AyatRepository();
  final ReadingMode mode;

  SurahParaListViewModel(this.mode);

  void init() {
    _surahParaList = _fetchData();
    rebuildUi();
  }

  List<SurahParaTileModel> _fetchData() {
    Map<int, Map<String, dynamic>> dataMap = {};

    for (var ayat in quran) {
      int id = mode == ReadingMode.surah ? ayat['surah_id'] : ayat['para_id'];
      String name =
          mode == ReadingMode.surah ? ayat['surah_name'] : ayat['para_name'];
      if (dataMap.containsKey(id)) {
        dataMap[id]!['verseCount'] += 1;
      } else {
        dataMap[id] = {
          'titleEnglish': name,
          'verseCount': 1,
        };
      }
    }

    List<SurahParaTileModel> dataList = dataMap.entries.map((entry) {
      return SurahParaTileModel(
        id: entry.key.toString(),
        titleEnglish: entry.value['titleEnglish'],
        verseCount: entry.value['verseCount'].toString(),
        titleArabic: mode == ReadingMode.surah
            ? entry.key.getSurahNameArabic
            : entry.key.getParaNameArabic,
      );
    }).toList();

    return dataList;
  }

  void onTileTap(int id, String name) {
    _navigateToSelectedSurahPara(id, name);
  }

  void _navigateToSelectedSurahPara(int id, String name) {
    List<AyatModel> surahParaAyats =
        _ayatRepository.getAyatBySurahPara(mode, id + 1);

    _navigationService.navigateTo(
      ayatListView,
      arguments: AyatListViewArgumentsModel(
        title: mode.type,
        subtitle: name,
        ayats: surahParaAyats,
      ),
    );
  }
}
