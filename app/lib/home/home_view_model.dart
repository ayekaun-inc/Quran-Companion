import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _searchText = '';
  String get searchText => _searchText;

  void onSearchTextChange(String? text) {
    if (text != null) _searchText = text;
  }

  void onSearchPressed() {
    // TODO: Add search logic
  }

  void onReadQuranPressed() {
    // TODO: Add dialog logic
  }
}
