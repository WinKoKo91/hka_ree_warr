import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'light_color.dart';

class AppTheme extends ChangeNotifier {
  static bool _isDark = false;

  ThemeData currentTheme() {
    return _isDark ? darkTheme : lightTheme;
  }

  static ThemeData lightTheme = ThemeData(
      backgroundColor: DarkColor.background,
      primaryColor: DarkColor.background,
      cardTheme: CardTheme(color: DarkColor.background),
      textTheme: GoogleFonts.padaukTextTheme(
        TextTheme(bodyText1: TextStyle(color: DarkColor.black)),
      ),
      iconTheme: IconThemeData(color: DarkColor.iconColor),
      bottomAppBarColor: DarkColor.background,
      dividerColor: DarkColor.lightGrey,
      primaryTextTheme:
          TextTheme(bodyText1: TextStyle(color: DarkColor.titleTextColor)));

  static ThemeData darkTheme = ThemeData(
      backgroundColor: DarkColor.background,
      primaryColor: DarkColor.background,
      cardTheme: CardTheme(color: DarkColor.background),
      textTheme: TextTheme(bodyText1: TextStyle(color: DarkColor.black)),
      iconTheme: IconThemeData(color: DarkColor.iconColor),
      bottomAppBarColor: DarkColor.background,
      dividerColor: DarkColor.lightGrey,
      primaryTextTheme:
          TextTheme(bodyText1: TextStyle(color: DarkColor.titleTextColor)));

  static TextStyle titleStyle =
      const TextStyle(color: DarkColor.titleTextColor, fontSize: 16);

  static TextStyle subTitleStyle =
      const TextStyle(color: DarkColor.subtitleTextColor, fontSize: 12);

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
