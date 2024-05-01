import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String DARKTHEME = "dark_theme";
  static const String LANGUAGE = "language";

  static late SharedPreferences _prefs;

  static Future<SharedPreferences> load() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  // Sets
  static Future<bool> setBool(String key, bool value) async =>
      _prefs.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      _prefs.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      _prefs.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      _prefs.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      _prefs.setStringList(key, value);

  // Gets
  static bool getBool(String key, {bool def = false}) =>
      _prefs.getBool(key) ?? def;

  static double getDouble(String key, {double def = -1}) =>
      _prefs.getDouble(key) ?? def;

  static int getInt(String key, {int def = -1}) => _prefs.getInt(key) ?? def;

  static String getString(String key, {String def = ''}) =>
      _prefs.getString(key) ?? def;

  static List<String> getStringList(String key,
          {List<String> def = const []}) =>
      _prefs.getStringList(key) ?? def;

  static bool isDark() {
    return getBool(DARKTHEME, def: false);
  }

  static void clear() {
    _prefs.clear();
  }
}
