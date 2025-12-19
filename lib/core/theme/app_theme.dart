import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Inter',
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF6F5F3),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF8E9AAF),
        secondary: const Color(0xFFCBC0D3),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}