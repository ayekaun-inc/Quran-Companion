import 'package:app/global/models/ayat_model.dart';

class SearchResultsViewArguments {
  final String searchTerm;
  final List<AyatModel> searchResults;

  SearchResultsViewArguments(
      {required this.searchTerm, required this.searchResults});
}
