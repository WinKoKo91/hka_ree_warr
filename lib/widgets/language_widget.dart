import 'package:flutter/material.dart';
import 'package:hka_ree_warr/models/language.dart';
import 'package:hka_ree_warr/resource/models/app_setting.dart';
import 'package:hka_ree_warr/resource/prefs.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatefulWidget {
  Language selectedLanguage;

  LanguageWidget(this.selectedLanguage);

  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  List<Language> languageList = [];
  Language selectedLanguage;

  @override
  void initState() {
    selectedLanguage = widget.selectedLanguage;
    languageList = Language.languageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        underline: SizedBox(),
        value: selectedLanguage,
        style: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.language,
          color: Colors.black54,
        ),
        items: languageList
            .map<DropdownMenuItem<Language>>((language) => DropdownMenuItem(
                value: language,
                child: Row(
                  children: [
                    Text(language.flag),
                    SizedBox(
                      width: 4,
                    ),
                    Text(language.name),
                  ],
                )))
            .toList(),
        onChanged: (Language language) {
          setState(() {
            this.selectedLanguage = language;
          });
          Provider.of<AppSetting>(context, listen: false)
              .onLanguageChange(language);
        });
  }
}
