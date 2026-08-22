import 'package:flutter/material.dart';

/// Définit les thèmes clair et sombre de l'application.
/// NOTE : version temporaire (couleurs/styles basiques),
/// à styliser par la partie UI du binôme.
class AppTheme {
  /// Thème clair de l'application.
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  /// Thème sombre de l'application.
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
    );
  }
}