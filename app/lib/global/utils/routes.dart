import 'package:quran_companion/global/models/ayat_list_view_arguments.dart';
import 'package:quran_companion/global/utils/enums.dart';
import 'package:quran_companion/views/home/home_view.dart';
import 'package:quran_companion/views/ayat_list/ayat_list_view.dart';
import 'package:quran_companion/views/splash/splash_view.dart';
import 'package:quran_companion/views/surah_para_list/surah_para_list_view.dart';
import 'package:flutter/material.dart';

const String splashView = '/splash';
const String homeView = '/home';
const String ayatListView = '/ayatList';
const String surahParaListView = '/surahParaList';

class RoutesPath {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case surahParaListView:
        ReadingMode args = settings.arguments as ReadingMode;
        return MaterialPageRoute(
          builder: (context) => SurahParaListView(mode: args),
        );
      case ayatListView:
        AyatListViewArguments args =
            settings.arguments as AyatListViewArguments;
        return MaterialPageRoute(
          builder: (context) => AyatListView(arguments: args),
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
