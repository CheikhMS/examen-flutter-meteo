import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/weather_controller.dart';
import '../widgets/progress_section.dart';
import '../widgets/loading_message.dart';
import '../widgets/weather_table.dart';
import '../utils/app_routes.dart';

/// Écran principal de chargement.
/// Affiche la jauge de progression, le message dynamique, puis le tableau
/// météo une fois les 5 villes récupérées. Gère aussi l'état d'erreur.
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /// Lance la récupération météo dès l'affichage de l'écran.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherController>().startFetching();
    });
  }

  /// Ramène directement à l'écran d'accueil, conformément au cahier
  /// des charges ("retour à tout moment").
  void _goHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _goHome(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Météo"),
          automaticallyImplyLeading: false, // Cache la flèche de retour automatique
          actions: [
            Consumer<WeatherController>(
              builder: (context, controller, _) {
                if (controller.isLoading) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(Icons.home),
                  tooltip: "Retour à l'accueil",
                  onPressed: () => _goHome(context),
                );
              },
            ),
          ],
        ),
        body: Consumer<WeatherController>(
          builder: (context, controller, _) {
            if (controller.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Erreur lors de la récupération des données."),
                    ElevatedButton(
                      onPressed: controller.retry,
                      child: const Text("Réessayer"),
                    ),
                  ],
                ),
              );
            }

            if (controller.isLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressSection(progress: controller.progress),
                    LoadingMessage(message: controller.currentMessage),
                  ],
                ),
              );
            }

            // Chargement terminé : jauge devenue bouton "Recommencer" +
            // tableau interactif des 5 villes.
            return Column(
              children: [
                ElevatedButton(
                  onPressed: controller.startFetching,
                  child: const Text("Recommencer"),
                ),
                Expanded(child: WeatherTable(weathers: controller.weathers)),
              ],
            );
          },
        ),
      ),
    );
  }
}