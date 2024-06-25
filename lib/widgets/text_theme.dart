import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constans/color_strings.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.w100, color: tDarkColor),
    bodyMedium: GoogleFonts.roboto(fontSize: 16.0, fontWeight: FontWeight.w400, color: tGrayColor),
    bodySmall: GoogleFonts.roboto(fontSize: 14.0, fontWeight: FontWeight.w400),
    headlineLarge: GoogleFonts.notoSansSc(fontSize: 24.0, fontWeight: FontWeight.w500, color: tDarkColor),
    headlineMedium: GoogleFonts.notoSansSc(fontSize: 22.0, fontWeight: FontWeight.w400, color: tDarkColor),
    headlineSmall: GoogleFonts.notoSansSc(fontSize: 16.0, fontWeight: FontWeight.w300, color: tGrayColor),
    titleLarge: GoogleFonts.inter(fontSize: 14.0, fontWeight: FontWeight.w500, color: tTextColor),
    titleMedium: GoogleFonts.inter(fontSize: 10.0, fontWeight: FontWeight.w600, color: tDarkColor),
    titleSmall: GoogleFonts.inter(fontSize: 8.0, fontWeight: FontWeight.w600, color: tDarkColor),
    displayLarge: GoogleFonts.inter(fontSize: 20.0, fontWeight: FontWeight.w700, color: tDarkColor),
    displayMedium: GoogleFonts.inter(fontSize: 16.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    displaySmall: GoogleFonts.inter(fontSize: 9.0, fontWeight: FontWeight.w400, color: tWhiteColor),
    labelSmall: GoogleFonts.inter(fontSize: 8.0, fontWeight: FontWeight.w400, color: tWhiteColor),
    labelMedium: GoogleFonts.inter(fontSize: 10.0, fontWeight: FontWeight.w500, color: tWhiteColor),
  );

  static TextTheme darkTextTheme = TextTheme();
}
