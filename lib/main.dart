import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hka_ree_warr/themes/theme.dart';

import 'config/routs.dart';
import 'pages/main_page.dart';
import 'pages/place_detail_page.dart';
import 'widgets/customRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveller',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: Routes.getRoute(),
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
  }
}
