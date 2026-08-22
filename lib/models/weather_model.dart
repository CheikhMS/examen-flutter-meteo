import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class Weather {
  final String city;
  final double temperature;
  final String description;
  final int humidity;
  final double latitude;
  final double longitude;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.latitude,
    required this.longitude,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}