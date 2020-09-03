class Language {
  final int id;
  final String name;
  final String flag;
  final String countryCode;

  Language(this.id, this.name, this.flag, this.countryCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", '🇺🇸', "en"),
      Language(2, "Myanmar", '🇲🇲', "my"),
    ];
  }
}
