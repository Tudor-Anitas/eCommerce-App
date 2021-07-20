import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  bool isDarkTheme = true;

  static ThemeData get darkTheme => ThemeData(
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

  ThemeData get currentTheme => isDarkTheme ? darkTheme : ThemeData.light();

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
