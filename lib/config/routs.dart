import 'package:flutter/material.dart';
import 'package:hka_ree_warr/pages/main_page.dart';

class Routes{
  static Map<String, WidgetBuilder> getRoute(){
    return <String, WidgetBuilder>{
      '/':(_) => MainPage(),
    };
  }
}