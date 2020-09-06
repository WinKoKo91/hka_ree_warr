import 'package:flutter/material.dart';
import 'package:hka_ree_warr/models/language.dart';
import 'package:hka_ree_warr/models/setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../prefs.dart';

class AppSetting extends ChangeNotifier {
  bool _isDark = false;
  Locale currentLocale;

  AppSetting() {
    _loadTheme();
  }

  void _loadTheme() {
    debugPrint("Entered loadTheme()");
    Prefs().getSetting().then((setting) {
      _isDark = setting.isDark ?? false;
      currentLocale = Language.currentLocale(setting.languageCode);
      notifyListeners();
    });
  }

  Locale currentLanguage() {
    return currentLocale;
  }

  bool isDarkTheme() {
    return _isDark;
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    Prefs().setDarkTheme(_isDark).then((value) => notifyListeners());
  }

  void onLanguageChange(Language language) {
    currentLocale = Locale(language.languageCode, language.countryCode);
    Prefs()
        .setLanguage(currentLocale.languageCode)
        .then((value) => notifyListeners());
  }
}
