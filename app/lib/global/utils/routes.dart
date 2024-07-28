import 'package:app/home/home_view.dart';
import 'package:app/splash/splash_view.dart';
import 'package:flutter/material.dart';

const String splashView = '/splash';
const String homeView = '/home';

class RoutesPath {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
