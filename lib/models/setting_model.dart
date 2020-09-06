class SettingModel {

  bool isDark;
  String languageCode;

  SettingModel(this.isDark, this.languageCode);

  @override
  String toString() {
    return 'SettingModel{isDark: $isDark, languageCode: $languageCode}';
  }
}
