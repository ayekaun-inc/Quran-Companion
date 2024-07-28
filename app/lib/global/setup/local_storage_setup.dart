import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;
  static SharedPreferences? get preferences => _preferences;

  static Future<SharedPreferences?> initializeSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }
}
