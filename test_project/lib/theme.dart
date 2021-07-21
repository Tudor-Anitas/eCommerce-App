import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme with ChangeNotifier {
  bool isDarkTheme = true;

  static ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: Color(0xff222831),
      backgroundColor: Color(0xff222831),
      accentColor: Color(0xff393E46),
      hintColor: Colors.amber,
      toggleableActiveColor: Colors.amber,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        headline3: TextStyle(color: Color(0xffEEEEEE)),
        headline5: TextStyle(color: Color(0xffEEEEEE)),
        headline6: TextStyle(color: Color(0xffEEEEEE)),
        bodyText2: TextStyle(color: Color(0xffEEEEEE)),
        bodyText1: TextStyle(color: Color(0xffEEEEEE)),
        subtitle1: TextStyle(color: Colors.red[600], fontSize: 24, fontWeight: FontWeight.w500)
      ));

  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Color(0xffFFF8F0),
    backgroundColor: Color(0xffFFF8F0),
    accentColor: Color(0xff9DD9D2),
    toggleableActiveColor: Color(0xff9DD9D2),
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.red[600], fontSize: 24, fontWeight: FontWeight.w500)
    )
  );
  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
