import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AyatListViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void onTryAgainTap() {
    _navigationService.back();
  }
}
