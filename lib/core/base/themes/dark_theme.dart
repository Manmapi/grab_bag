import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkThemeData = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.black,
  ),
  textTheme: GoogleFonts.openSansTextTheme(ThemeData.dark().textTheme),
  cupertinoOverrideTheme: CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: GoogleFonts.openSansTextTheme().button,
    ),
  ),
);
