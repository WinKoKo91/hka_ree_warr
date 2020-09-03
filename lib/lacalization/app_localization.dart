import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization({this.locale});

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String> _localizatedValue;

  Future load() async {
    String jsonStringValue =
        await rootBundle.loadString("i18n/${locale.languageCode}.json");
    Map<String, dynamic> mappedJson = json.decode(jsonStringValue);
    _localizatedValue =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizatedValue[key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationsDelegate();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'my'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = new AppLocalization(locale: locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
