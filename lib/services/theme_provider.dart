import 'package:flutter/material.dart';

/// Gère le thème actif de l'application (clair ou sombre).
/// Permet de basculer manuellement via un bouton, indépendamment
/// du thème système de l'appareil.
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  /// Thème actuellement actif.
  ThemeMode get themeMode => _themeMode;

  /// Indique si le mode sombre est actuellement actif.
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Bascule entre le mode clair et le mode sombre.
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}