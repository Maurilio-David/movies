import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Color(0XFFFFFFFF);
const ice = Color(0XFFF1F3F5);
const darkBlue = Color(0XFF00384C);
const gray = Color(0XFF343A40);
const gray2 = Color(0XFF5E6770);
const darkGradient = LinearGradient(
    colors: [
      Color(0xff000000),
      Color(0xff000000a1),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.bottomLeft,
    end: Alignment.centerRight);

final ThemeData appTheme = ThemeData(
    primaryColor: darkBlue,
    backgroundColor: white,
    highlightColor: const Color(0xFF309CC3),
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    appBarTheme: const AppBarTheme(elevation: 0, color: Color(0xFFF2F2F2)),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
        color: darkBlue,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: GoogleFonts.montserrat(
        color: gray,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      headline1: GoogleFonts.montserrat(
        color: gray2,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      headline2: GoogleFonts.montserrat(
        color: gray2,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline3: GoogleFonts.montserrat(
        color: gray2,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      headline4: GoogleFonts.montserrat(
        color: gray2,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      headline5: GoogleFonts.montserrat(
        color: gray2,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ));
