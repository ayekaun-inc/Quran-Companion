import 'package:app/global/utils/routes.dart';
import 'package:app/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> init() async {
    await simulateLoading();
    await navigateToHome();
  }

  Future<void> simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> navigateToHome() async {
    await _navigationService.clearStackAndShow(homeView);
  }
}
