import 'package:dio/dio.dart';
import '../models/weather_model.dart';
import '../utils/constants.dart';
import 'weather_api.dart';

/// Service responsable de récupérer les données météo pour toutes les villes.
/// Fait le lien entre l'API Retrofit et le modèle Weather utilisé par l'UI.
class WeatherService {
  final WeatherApi _api;

  WeatherService(Dio dio) : _api = WeatherApi(dio);

  /// Récupère la météo d'une seule ville.
  /// Lève une exception en cas d'échec (à catcher par l'appelant pour le retry).
  Future<Weather> fetchWeatherForCity(String city) async {
    final response = await _api.getWeatherByCity(
      city,
      Constants.openWeatherApiKey,
      Constants.units,
      Constants.lang,
    );
    return response.toWeather();
  }

  /// Récupère la météo pour toutes les villes définies dans Constants.cities.
  /// Retourne la liste complète des résultats, dans le même ordre que Constants.cities.
  /// Si une ville échoue, l'exception remonte (à gérer par l'appelant, écran de chargement).
  Future<List<Weather>> fetchAllCities() async {
    final results = <Weather>[];
    for (final city in Constants.cities) {
      final weather = await fetchWeatherForCity(city);
      results.add(weather);
    }
    return results;
  }
}