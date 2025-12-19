import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Inter',
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFF6F5F3),
      colorScheme: ColorScheme.light(
        primary: Color(0xFF8E9AAF),
        secondary: Color(0xFFCBC0D3),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      )
    );
  }
}