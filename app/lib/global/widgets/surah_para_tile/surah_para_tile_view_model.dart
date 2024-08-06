import 'package:app/global/models/ayat_list_view_arguments.dart';
import 'package:app/global/models/ayat_model.dart';
import 'package:app/global/repositories/ayat_repository.dart';
import 'package:app/global/utils/routes.dart';
import 'package:app/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SurahParaTileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // TODO: Make a service for ayat repo and provider
  final AyatRepository _ayatRepository = AyatRepository();

  void onSurahParaTileTap(int id) {
    // TODO: Implement navigation to sura/para view
    List<AyatModel> surahAyats = _ayatRepository.getAyatBySurah(id);
    _navigationService.navigateTo(
      ayatListView,
      arguments: AyatListViewArguments(
        title: 'Read Quran',
        subtitle: 'By Para',
        ayats: surahAyats,
      ),
    );
  }
}
