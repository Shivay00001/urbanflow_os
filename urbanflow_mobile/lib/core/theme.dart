import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme _textTheme = GoogleFonts.outfitTextTheme();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF00E5FF), // Cyber Cyan
      scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate 900
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF00E5FF),
        secondary: Color(0xFFD946EF), // Fuchsia
        surface: Color(0xFF1E293B), // Slate 800
        background: Color(0xFF0F172A),
      ),
      textTheme: _textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      useMaterial3: true,
      cardTheme: CardTheme(
        color: const Color(0xFF1E293B).withOpacity(0.8),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF0284C7),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0284C7),
        secondary: Color(0xFF9333EA),
        surface: Colors.white,
      ),
      textTheme: _textTheme.apply(
        bodyColor: const Color(0xFF0F172A),
        displayColor: const Color(0xFF0F172A),
      ),
      useMaterial3: true,
    );
  }
}
