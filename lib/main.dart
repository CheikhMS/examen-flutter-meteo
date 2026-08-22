import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'services/weather_service.dart';
import 'services/weather_controller.dart';
import 'theme/app_theme.dart';
import 'utils/app_routes.dart';

/// Point d'entrée de l'application.
/// Instancie les services et le contrôleur, puis les expose via Provider
/// à tout l'arbre de widgets.
void main() {
  runApp(const MyApp());
}

/// Widget racine de l'application.
/// Configure le thème clair/sombre et les routes de navigation.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Client Dio configuré avec un timeout court pour éviter que
    // l'utilisateur attende trop longtemps avant de voir l'erreur.
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    return ChangeNotifierProvider(
      create: (_) => WeatherController(WeatherService(dio)),
      child: MaterialApp(
        title: 'Météo App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}