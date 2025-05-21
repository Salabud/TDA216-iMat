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
  static const Color darkGreen = Color(0xff3C7204);
  static const Color red = Color(0xffFA453C);
  static const Color darkRed = Color(0xffB6061D);

  static const Color offBlack = Color(0xff414141);
  static const Color grey = Color(0xff7D7D7D);
  static const Color darkGrey = Color(0xff6D6D6D);
  static const Color lightGrey = Color.fromARGB(255, 132, 67, 6);
  static const Color bottomCardGrey = Color(0xffEBEBEB);
  static const Color browseAreaBG = Color(0xffEEEEEE);
  static const Color favColor = Color(0xffFFB640);
  static const Color unFavColor = Color(0xffD9D9D9);

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
