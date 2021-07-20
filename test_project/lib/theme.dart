import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get customTheme {
    return ThemeData(
        scaffoldBackgroundColor: Color(0xff222831),
        backgroundColor: Color(0xff222831),
        accentColor: Color(0xff393E46),
        hintColor: Color(0xff393E46),
        textTheme: TextTheme(
          headline3: TextStyle(color: Color(0xffEEEEEE)),
          headline5: TextStyle(color: Color(0xffEEEEEE)),
          headline6: TextStyle(color: Color(0xffEEEEEE)),
          bodyText2: TextStyle(color: Color(0xffEEEEEE)),
          bodyText1: TextStyle(color: Color(0xffEEEEEE)),
        ));
  }
}
