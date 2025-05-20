import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const double paddingTiny = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMediumSmall = 12.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingHuge = 32.0;

  static const Color orange = Color(0xffFAA43C);
  static const Color darkOrange = Color(0xffD26600);
  static const Color green = Color(0xff98C849);
  static const Color darkGreen = Color.fromARGB(255, 132, 67, 6);
  static const Color red = Color.fromARGB(255, 132, 67, 6);
  static const Color darkRed = Color.fromARGB(255, 132, 67, 6);

  static const Color black = Color.fromARGB(255, 132, 67, 6);
  static const Color grey = Color.fromARGB(255, 132, 67, 6);
  static const Color darkGrey = Color(0xff6D6D6D);
  static const Color lightGrey = Color.fromARGB(255, 132, 67, 6);
  static const Color bottomCardGrey = Color(0xffEBEBEB);
  static const Color browseAreaBG = Color(0xffEEEEEE);
  static const Color offWhite = Color.fromARGB(255, 132, 67, 6);

  static ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

  static TextStyle logoStyle = TextStyle(
    fontFamily: 'MadimiOne',
    fontSize: 70,
    color:Colors.white,
  );
  static TextStyle iStyle = TextStyle(
    fontFamily: 'MadimiOne',
    fontSize: 70,
    color: AppTheme.darkOrange,
  );
}
