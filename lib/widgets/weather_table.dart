import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../utils/app_routes.dart';

/// Tableau affichant les données météo des 5 villes récupérées.
/// Le clic sur une ligne ouvre l'écran de détail de la ville concernée.
/// NOTE : version temporaire, à styliser par la partie UI du binôme.
class WeatherTable extends StatelessWidget {
  final List<Weather> weathers;

  const WeatherTable({super.key, required this.weathers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weathers.length,
      itemBuilder: (context, index) {
        final weather = weathers[index];
        return ListTile(
          title: Text(weather.city),
          subtitle: Text("${weather.temperature}°C - ${weather.description}"),
          onTap: () {
            // Ouvre l'écran de détail avec la ville sélectionnée.
            Navigator.pushNamed(context, AppRoutes.detail, arguments: weather);
          },
        );
      },
    );
  }
}