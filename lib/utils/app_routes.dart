import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/weather_detail_screen.dart';
import '../models/weather_model.dart';

/// Centralise la définition des routes de l'application.
/// Permet une navigation nommée cohérente entre les écrans.
class AppRoutes {
  static const String home = '/';
  static const String loading = '/loading';
  static const String detail = '/detail';

  /// Génère la route correspondante à un nom donné.
  /// Utilisé par MaterialApp.onGenerateRoute pour router dynamiquement,
  /// notamment pour passer des arguments (ex: la ville sélectionnée).
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());

      case detail:
        final weather = settings.arguments as Weather;
        return MaterialPageRoute(
          builder: (_) => WeatherDetailScreen(weather: weather),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route inconnue')),
          ),
        );
    }
  }
}