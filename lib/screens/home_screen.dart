import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

/// Écran d'accueil de l'application.
/// Affiche un message de bienvenue et un bouton pour démarrer l'expérience.
/// NOTE : version temporaire, à styliser par la partie UI du binôme.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenue sur l'application météo !"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lance l'expérience : navigation vers l'écran de chargement.
                Navigator.pushNamed(context, AppRoutes.loading);
              },
              child: const Text("Démarrer"),
            ),
          ],
        ),
      ),
    );
  }
}