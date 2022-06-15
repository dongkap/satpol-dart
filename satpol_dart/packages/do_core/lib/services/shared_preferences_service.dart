import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _sharedPreferences;
  static SharedPreferencesService? _instance;

  static Future<SharedPreferencesService?> getInstance() async {
    _instance ??= SharedPreferencesService();
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  Future<bool> putBool(String key, bool value) =>
      _sharedPreferences!.setBool(key, value);

  bool getBool(String key) => _sharedPreferences == null
      ? false
      : _sharedPreferences!.getBool(key) ?? false;

  Future<bool> putDouble(String key, double value) =>
      _sharedPreferences!.setDouble(key, value);

  double getDouble(String key) =>
      _sharedPreferences == null ? 0 : _sharedPreferences!.getDouble(key) ?? 0;

  Future<bool> putInt(String key, int value) =>
      _sharedPreferences!.setInt(key, value);

  int getInt(String key) =>
      _sharedPreferences == null ? 0 : _sharedPreferences!.getInt(key) ?? 0;

  Future<bool> putString(String key, String value) =>
      _sharedPreferences!.setString(key, value);

  String getString(String key) => _sharedPreferences == null
      ? ''
      : _sharedPreferences!.getString(key) ?? '';

  Future<bool> putStringList(String key, List<String> value) =>
      _sharedPreferences!.setStringList(key, value);

  List<String> getStringList(String key) => _sharedPreferences == null
      ? List.empty()
      : _sharedPreferences!.getStringList(key) ?? List.empty();

  bool isKeyExists(String key) => _sharedPreferences!.containsKey(key);

  Future<bool> clearKey(String key) => _sharedPreferences!.remove(key);

  Future<bool> clearAll() => _sharedPreferences!.clear();
}
