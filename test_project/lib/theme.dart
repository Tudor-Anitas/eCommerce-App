import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme with ChangeNotifier {
  bool isDarkTheme = true;

  static ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: Color(0xff2657eb),
      backgroundColor: Color(0xffde6161),
      accentColor: Color(0xff181818),
      hintColor: Colors.grey,
      cardColor: Color(0xffEEEEEE),
      iconTheme: IconThemeData(color: Color(0xffEEEEEE)),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
          headline2: TextStyle(color: Color(0xffEEEEEE)),
          headline4: TextStyle(color: Color(0xffEEEEEE)),
          headline5: TextStyle(color: Color(0xffEEEEEE), fontSize: 30),
          headline6:
              TextStyle(color: Color(0xffEEEEEE), fontWeight: FontWeight.w700),
          bodyText2: TextStyle(color: Color(0xffEEEEEE)),
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          button: TextStyle(color: Color(0xffEEEEEE)),
          caption: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          subtitle2: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          subtitle1: TextStyle(
              color: Color(0xffEEEEEE),
              fontSize: 11,
              fontWeight: FontWeight.w500)),
      appBarTheme: AppBarTheme(backgroundColor: Color(0xffde6161)),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      )));

  static ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: Color(0xffFFF8F0),
      backgroundColor: Color(0xffFFF8F0),
      accentColor: Color(0xff9DD9D2),
      cardColor: Color(0xff9DD9D2),
      toggleableActiveColor: Color(0xff9DD9D2),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            color: Colors.amber[800],
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ));
  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
