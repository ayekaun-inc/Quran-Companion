import 'package:app/home/home_view.dart';
import 'package:app/para_list/para_list_view.dart';
import 'package:app/search_results/search_results_view.dart';
import 'package:app/splash/splash_view.dart';
import 'package:app/surah/surah_view.dart';
import 'package:app/surah_list/surah_list_view.dart';
import 'package:flutter/material.dart';

const String splashView = '/splash';
const String homeView = '/home';
const String searchResultsView = '/searchResults';
const String surahListView = '/surahList';
const String paraListView = '/paraList';
const String surahView = '/surah';

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
      case searchResultsView:
        return MaterialPageRoute(
            builder: (context) => const SearchResultsView());
      case surahView:
        return MaterialPageRoute(builder: (context) => const SurahView());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
