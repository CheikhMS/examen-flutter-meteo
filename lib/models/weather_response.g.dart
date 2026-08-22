// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      name: json['name'] as String,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
);

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
  'lat': instance.lat,
  'lon': instance.lon,
};

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) =>
    WeatherDescription(description: json['description'] as String);

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{'description': instance.description};

Main _$MainFromJson(Map<String, dynamic> json) => Main(
  temp: (json['temp'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
);

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'humidity': instance.humidity,
};
