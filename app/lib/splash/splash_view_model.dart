import 'package:quran_companion/global/utils/routes.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  double _opacity = 0;
  double get opacity => _opacity;

  Future<void> init() async {
    await _runAnimation();
    await _simulateLoading();
    await _navigateToHome();
  }

  Future<void> _runAnimation() async {
    Future.delayed(const Duration(milliseconds: 333), () {
      _opacity = 1;
      rebuildUi();
    });
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> _navigateToHome() async {
    await _navigationService.clearStackAndShow(homeView);
  }
}
