import 'package:flutter/foundation.dart';
import 'weather_service.dart';
import '../models/weather_model.dart';
import '../utils/constants.dart';

/// Contrôleur central de l'écran de chargement.
/// Gère la progression de la jauge, le message d'attente (basé sur
/// l'avancement réel), les appels API séquentiels pour les 5 villes,
/// et la gestion des erreurs/retry.
class WeatherController extends ChangeNotifier {
  final WeatherService _service;

  WeatherController(this._service);

  /// Messages affichés selon l'avancement réel de la progression.
  static const String _messageDebut = "Récupération des données...";
  static const String _messageMilieu = "Mise en place...";
  static const String _messageFin = "Le rendu est presque prêt…";

  final List<Weather> _weathers = [];
  double _progress = 0.0;
  bool _hasError = false;
  bool _isLoading = false;

  /// Liste des données météo déjà récupérées (utilisée par le tableau final).
  List<Weather> get weathers => List.unmodifiable(_weathers);

  /// Progression actuelle de la jauge, entre 0.0 et 1.0.
  double get progress => _progress;

  /// Message d'attente correspondant à l'avancement actuel de la progression.
  /// Change automatiquement selon les paliers atteints (début, milieu, fin).
  String get currentMessage {
    if (_progress >= 0.8) return _messageFin;
    if (_progress >= 0.4) return _messageMilieu;
    return _messageDebut;
  }

  /// Indique si le dernier appel API a échoué.
  bool get hasError => _hasError;

  /// Indique si un chargement est en cours.
  bool get isLoading => _isLoading;

  /// Démarre (ou relance) la récupération météo des 5 villes.
  /// Réinitialise l'état avant de commencer.
  Future<void> startFetching() async {
    _weathers.clear();
    _progress = 0.0;
    _hasError = false;
    _isLoading = true;
    notifyListeners();

    await _fetchNextCity(0);
  }

  /// Relance la récupération après une erreur, en repartant de la ville
  /// qui a échoué (index courant).
  Future<void> retry() async {
    _hasError = false;
    _isLoading = true;
    notifyListeners();
    await _fetchNextCity(_weathers.length);
  }

  /// Récupère la météo d'une ville à l'index donné, puis enchaîne sur la
  /// suivante. Met à jour la progression après chaque succès.
  /// En cas d'échec, arrête la boucle et signale l'erreur (retry manuel).
  Future<void> _fetchNextCity(int index) async {
    if (index >= Constants.cities.length) {
      _finishLoading();
      return;
    }

    try {
      final weather = await _service.fetchWeatherForCity(Constants.cities[index]);
      _weathers.add(weather);
      _progress = (index + 1) / Constants.cities.length;
      notifyListeners();

      // Petit délai pour rendre la progression visible à l'utilisateur,
      // conformément à la consigne "appels toutes les quelques secondes".
      await Future.delayed(const Duration(seconds: 1));

      await _fetchNextCity(index + 1);
    } catch (e) {
      _hasError = true;
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Termine le chargement une fois les 5 villes récupérées.
  void _finishLoading() {
    _isLoading = false;
    notifyListeners();
  }
}