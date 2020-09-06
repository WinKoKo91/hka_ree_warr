import 'package:hka_ree_warr/models/setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final String IS_DARK_THEME = "is_dark_theme";
  static final String LANGUAGE = "language";

  Future<void> setDarkTheme(bool isDark) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(IS_DARK_THEME, isDark);
  }

  Future<bool> isDarkTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(IS_DARK_THEME);
  }

  Future<void> setLanguage(String language) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(LANGUAGE, language);
  }

  Future<String> getLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(LANGUAGE);
  }

  Future<SettingModel> getSetting() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return SettingModel(preferences.getBool(IS_DARK_THEME), preferences.getString(LANGUAGE));
  }
}
