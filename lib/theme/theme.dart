import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurschat/consts/color_string.dart';

ThemeData themeStyle = ThemeData(
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.notoSansSc(fontSize: 24.0, fontWeight: FontWeight.w500, color: nDarkColor),
    headlineMedium: GoogleFonts.notoSansSc(fontSize: 20.0, fontWeight: FontWeight.w500, color: nWhiteColor),
    headlineSmall: GoogleFonts.notoSansSc(fontSize: 12.0, fontWeight: FontWeight.w300, color: nDarkColor),
  )
);