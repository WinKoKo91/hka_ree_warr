import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hka_ree_warr/lacalization/app_localization.dart';
import 'package:hka_ree_warr/models/language.dart';
import 'package:hka_ree_warr/resource/models/app_setting.dart';
import 'package:hka_ree_warr/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routs.dart';
import 'pages/main_page.dart';
import 'pages/place_detail_page.dart';
import 'resource/prefs.dart';
import 'widgets/customRoute.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSetting()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSetting>(builder: (context, appSetting, child) {
      return MaterialApp(
        locale: appSetting.currentLanguage(),
        title: 'Traveller',
        darkTheme: AppTheme.darkTheme,
        themeMode: appSetting.currentTheme(),
        theme: AppTheme.lightTheme,

        supportedLocales: Language.languageList()
            .map((language) =>
                Locale(language.languageCode, language.countryCode))
            .toList(),
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocale) {
          for (var locale in supportedLocale) {
            if (locale.languageCode == deviceLocale.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocale.first;
        },
        routes: Routes.getRoute(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name.contains('detail')) {
            return CustomRoute<bool>(
                builder: (BuildContext context) => PlaceDetailPage());
          } else {
            return CustomRoute<bool>(
                builder: (BuildContext context) => MainPage());
          }
        },
        initialRoute: "MainPage",
      );
    });
  }
}
