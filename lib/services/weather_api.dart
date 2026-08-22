import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/weather_response.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  /// Récupère les données météo actuelles d'une ville donnée.
  /// [city] : nom de la ville (ex: "Dakar").
  /// [apiKey] : clé API OpenWeather.
  /// [units] : unité de mesure ("metric" pour Celsius).
  /// Retourne un [WeatherResponse] correspondant à la réponse brute de l'API.
  @GET("weather")
  Future<WeatherResponse> getWeatherByCity(
      @Query("q") String city,
      @Query("appid") String apiKey,
      @Query("units") String units,
      @Query("lang") String lang,
      );
}