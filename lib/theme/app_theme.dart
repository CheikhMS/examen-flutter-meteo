import 'package:flutter/material.dart';

/// Définit les thèmes clair et sombre de l'application météo.
/// Centralise les couleurs, la typographie et le style des composants
/// (boutons, AppBar, cartes) pour une interface visuelle cohérente.
class AppTheme {
  // Couleurs principales de la palette.
  static const Color _primaryBlue = Color(0xFF2F80ED);
  static const Color _accentOrange = Color(0xFFF2994A); // Accent du thème clair
  static const Color _accentCyan = Color(0xFF56CCF2);   // Accent du thème sombre

  /// Thème clair de l'application.
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF5F8FC),
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryBlue,
        brightness: Brightness.light,
        primary: _primaryBlue,
        secondary: _accentOrange,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1A1A),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Color(0xFF333333),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _accentOrange,
        linearTrackColor: Color(0xFFE0E7F1),
      ),
    );
  }

  /// Thème sombre de l'application.
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF121417),
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryBlue,
        brightness: Brightness.dark,
        primary: _primaryBlue,
        secondary: _accentCyan,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A1D21),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Color(0xFFD0D0D0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _accentCyan,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E2126),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _accentCyan,
        linearTrackColor: Color(0xFF2A2E33),
      ),
    );
  }
}