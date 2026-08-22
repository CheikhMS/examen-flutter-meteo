// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
  city: json['city'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  description: json['description'] as String,
  humidity: (json['humidity'] as num).toInt(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
  'city': instance.city,
  'temperature': instance.temperature,
  'description': instance.description,
  'humidity': instance.humidity,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
