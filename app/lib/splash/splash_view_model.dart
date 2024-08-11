import 'package:package_info_plus/package_info_plus.dart';
import 'package:quran_companion/global/utils/routes.dart';
import 'package:quran_companion/global/utils/ui_helpers.dart';
import 'package:quran_companion/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String? _appVersion;
  String? get appVersion => _appVersion;

  double _opacity = 0;
  double get opacity => _opacity;

  Future<void> init() async {
    await _runAnimation();
    await _getAppVersion();
    await simulateLoading();
    await _navigateToHome();
  }

  Future<void> _runAnimation() async {
    await Future.delayed(const Duration(milliseconds: 666), () {
      _opacity = 1;
      rebuildUi();
    });
  }

  Future<void> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String version = packageInfo.version;
    if (version.isNotEmpty) {
      _appVersion = version;
      rebuildUi();
    }
  }

  Future<void> _navigateToHome() async {
    await _navigationService.clearStackAndShow(homeView);
  }
}
