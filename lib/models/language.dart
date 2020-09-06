import 'dart:ui';

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  final String countryCode;

  Language(this.id, this.name, this.flag, this.languageCode, this.countryCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", '🇺🇸', "en", "US"),
      Language(2, "Myanmar", '🇲🇲', "my", "MM"),
    ];
  }

  static Language getLanguage(String languageCode) {
    Language language;
    for (Language element in languageList()) {
      if (element.languageCode == languageCode) {
        language = element;
        break;
      }
    }
    return language;
  }

  static Locale currentLocale(String languageCode) {
    List<Language> list = languageList();
    Locale currentLocale;

    if (languageCode == null || languageCode.isEmpty) {
      Language language = list.first;
      currentLocale = Locale(language.languageCode, language.countryCode);
    } else {
      for (Language language in list) {
        if (language.languageCode == languageCode) {
          currentLocale = Locale(language.languageCode, language.countryCode);
          break;
        }
      }
      return currentLocale;
    }
  }
}
