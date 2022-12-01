import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.black,
  ),
  textTheme: GoogleFonts.openSansTextTheme(ThemeData.light().textTheme),
  cupertinoOverrideTheme: CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: GoogleFonts.openSansTextTheme().button,
    ),
  ),
);
