import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../utils/app_routes.dart';

/// Tableau interactif affichant les données météo des 5 villes récupérées.
/// Chaque ville est présentée sous forme de carte cliquable, menant
/// vers l'écran de détail correspondant.
class WeatherTable extends StatelessWidget {
  final List<Weather> weathers;

  const WeatherTable({super.key, required this.weathers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: weathers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final weather = weathers[index];
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              // Ouvre l'écran de détail avec la ville sélectionnée.
              Navigator.pushNamed(context, AppRoutes.detail, arguments: weather);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.cloud_outlined,
                    size: 36,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.city,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          weather.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${weather.temperature.round()}°C",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}