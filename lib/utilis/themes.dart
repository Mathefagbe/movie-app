import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static ThemeData darkThemes() {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.white),
        textTheme: lighttextTheme);
  }

  static ThemeData lightThemes() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black),
        textTheme: darktextTheme);
  }

  static TextTheme darktextTheme = TextTheme(
      headline1: GoogleFonts.roboto(
          color: Colors.black26, fontSize: 12, fontWeight: FontWeight.w600),
      headline2: GoogleFonts.lato(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
      bodyText1: GoogleFonts.openSans(
        fontSize: 17.0,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline3: GoogleFonts.openSans(
        fontSize: 10.0,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      headline6: GoogleFonts.openSans(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline4: GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ));
  static TextTheme lighttextTheme = TextTheme(
      headline1: GoogleFonts.roboto(
          color: Colors.white24, fontSize: 12, fontWeight: FontWeight.w600),
      headline2: GoogleFonts.lato(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      bodyText1: GoogleFonts.openSans(
        fontSize: 17.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline3: GoogleFonts.openSans(
        fontSize: 10.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      headline6: GoogleFonts.openSans(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline4: GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ));
}

final lightthemes = CustomThemes.lightThemes();
final darktheme = CustomThemes.darkThemes();
