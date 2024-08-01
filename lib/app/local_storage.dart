import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLocalStorage {
  static SharedPreferenceLocalStorage? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferenceLocalStorage> getInstance() async {
    _instance ??= SharedPreferenceLocalStorage();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future setInt(String key, int value) async {
    return await _preferences?.setInt(key, value);
  }

  Future setString(String key, String value) async {
    return await _preferences?.setString(key, value);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  Future<bool?> clearStorage() async => await _preferences?.clear();
}
