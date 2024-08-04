import 'package:app/global/utils/routes.dart';
import 'package:app/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SurahParaTileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void onSurahParaTileTap() {
    _navigationService.navigateTo(paraView);
  }
}
