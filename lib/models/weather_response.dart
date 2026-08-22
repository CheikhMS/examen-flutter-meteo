import 'package:json_annotation/json_annotation.dart';
import 'weather_model.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final String name;
  final Coord coord;
  final List<WeatherDescription> weather;
  final Main main;

  WeatherResponse({
    required this.name,
    required this.coord,
    required this.weather,
    required this.main,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);


  Weather toWeather() {
    return Weather(
      city: name,
      temperature: main.temp,
      description: weather.isNotEmpty ? weather.first.description : '',
      humidity: main.humidity,
      latitude: coord.lat,
      longitude: coord.lon,
    );
  }
}

@JsonSerializable()
class Coord {
  final double lat;
  final double lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class WeatherDescription {
  final String description;

  WeatherDescription({required this.description});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}

@JsonSerializable()
class Main {
  final double temp;
  final int humidity;

  Main({required this.temp, required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}