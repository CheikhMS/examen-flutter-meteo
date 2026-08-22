/// Constantes globales de l'application.
/// Contient la clé API météo, les paramètres et la liste des villes affichées.
class Constants {
  /// Clé API OpenWeather utilisée pour les appels météo.
  static const String openWeatherApiKey = "c43dde7c00e733fb885303d494dfcb4c";

  /// Unité de mesure utilisée pour les appels météo (Celsius).
  static const String units = "metric";

  /// Liste des 5 villes affichées dans l'application (Dakar et villes proches).
  static const List<String> cities = [
    "Dakar",
    "Thies",
    "Rufisque",
    "Mbour",
    "Saint-Louis",
  ];
  /// Langue utilisée pour les descriptions météo (français).
  static const String lang = "fr";
}