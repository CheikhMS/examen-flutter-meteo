import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'services/weather_service.dart';
import 'services/weather_controller.dart';
import 'services/theme_provider.dart';
import 'theme/app_theme.dart';
import 'utils/app_routes.dart';

/// Point d'entrée de l'application.
/// Instancie les services et les contrôleurs, puis les expose via Provider
/// à tout l'arbre de widgets.
void main() {
  runApp(const MyApp());
}

/// Widget racine de l'application.
/// Configure le thème clair/sombre (basculable manuellement) et les routes.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherController(WeatherService(dio))),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Météo App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}