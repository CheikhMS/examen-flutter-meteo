import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/weather_model.dart';
import '../utils/app_routes.dart';

/// Écran de détail affichant les informations météo d'une ville
/// ainsi que sa localisation sur une carte (OpenStreetMap via flutter_map).
/// NOTE : le style visuel (hors carte) reste à finaliser par la partie UI du binôme.
class WeatherDetailScreen extends StatelessWidget {
  final Weather weather;

  const WeatherDetailScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    // Position de la ville sur la carte, basée sur les coordonnées reçues de l'API.
    final position = LatLng(weather.latitude, weather.longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.city),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: "Retour à l'accueil",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Température : ${weather.temperature}°C"),
                Text("Description : ${weather.description}"),
                Text("Humidité : ${weather.humidity}%"),
              ],
            ),
          ),
          // Carte affichant la localisation exacte de la ville.
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: position,
                initialZoom: 10,
              ),
              children: [
                // Fond de carte OpenStreetMap (gratuit, sans clé API).
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.examen',
                ),
                // Marqueur sur la position exacte de la ville.
                MarkerLayer(
                  markers: [
                    Marker(
                      point: position,
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(weather.city),
                              content: Text("${weather.temperature}°C - ${weather.description}"),
                            ),
                          );
                        },
                        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}