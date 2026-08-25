import 'package:flutter/material.dart';

/// Affiche le message d'attente dynamique pendant le chargement.
/// Transition en fondu lors du changement de message pour un rendu
/// plus doux qu'un simple remplacement de texte.
class LoadingMessage extends StatelessWidget {
  final String message;

  const LoadingMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: Text(
        message,
        key: ValueKey(message),
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}