import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hka_ree_warr/resource/prefs.dart';
import 'package:hka_ree_warr/themes/dark_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'light_color.dart';

class AppTheme extends ChangeNotifier {
  static ThemeData lightTheme = ThemeData(
      backgroundColor: LightColor.background,
      primaryColor: LightColor.background,
      primaryColorBrightness: Brightness.light,
      brightness: Brightness.light,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: LightColor.background,
      cardTheme: CardTheme(color: LightColor.background),
      iconTheme: IconThemeData(color: LightColor.iconColor),
      bottomAppBarColor: LightColor.background,
      dividerColor: LightColor.lightGrey,
      primaryTextTheme:
          TextTheme(bodyText1: TextStyle(color: LightColor.titleTextColor)));

  static ThemeData darkTheme = ThemeData(
      backgroundColor: DarkColor.background,
      primaryColor: DarkColor.background,
      primaryColorBrightness: Brightness.dark,
      brightness: Brightness.dark,
      canvasColor: DarkColor.black,
      scaffoldBackgroundColor: DarkColor.background,
      cardTheme: CardTheme(color: DarkColor.background),
      iconTheme: IconThemeData(color: DarkColor.iconColor),
      bottomAppBarColor: DarkColor.background,
      dividerColor: DarkColor.lightGrey,
      primaryTextTheme:
          TextTheme(bodyText1: TextStyle(color: DarkColor.titleTextColor)));

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);

  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subtitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 25)
  ];

  static List<BoxShadow> favoriteShadow = <BoxShadow>[
    BoxShadow(color: Color(0x30000000), blurRadius: 10, spreadRadius: 1)
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 20,
  );
  static EdgeInsets vPadding = const EdgeInsets.symmetric(
    vertical: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
