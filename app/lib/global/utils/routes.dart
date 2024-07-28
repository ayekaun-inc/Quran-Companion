import 'package:app/home/home_view.dart';
import 'package:app/para_list/para_list_view.dart';
import 'package:app/splash/splash_view.dart';
import 'package:app/surah_list/surah_list_view.dart';
import 'package:flutter/material.dart';

const String splashView = '/splash';
const String homeView = '/home';
const String surahListView = '/surahList';
const String paraListView = '/paraList';

class RoutesPath {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case surahListView:
        return MaterialPageRoute(builder: (context) => const SurahListView());
      case paraListView:
        return MaterialPageRoute(builder: (context) => const ParaListView());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
