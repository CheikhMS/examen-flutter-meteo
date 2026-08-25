import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_routes.dart';
import '../services/theme_provider.dart';

/// Écran d'accueil de l'application.
/// Affiche un message de bienvenue, une icône météo, un bouton pour
/// démarrer l'expérience, et un bouton pour basculer le thème.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        actions: [
          // Bouton pour basculer entre mode clair et mode sombre.
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                tooltip: "Changer de thème",
                onPressed: themeProvider.toggleTheme,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icône illustrant le thème météo de l'application.
                const Icon(
                  Icons.wb_sunny_rounded,
                  size: 96,
                  color: Color(0xFFF2994A),
                ),
                const SizedBox(height: 24),

                Text(
                  "Bienvenue !",
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                Text(
                  "Découvrez la météo en direct de Dakar et de ses environs, "
                      "présentée sur une carte interactive.",
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.loading);
                  },
                  child: const Text("Démarrer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}