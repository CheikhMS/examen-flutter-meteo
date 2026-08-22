// widgets/loading_message.dart

import 'package:flutter/material.dart';

/// Affiche le message d'attente dynamique pendant le chargement.
/// NOTE : version temporaire, à styliser par la partie UI du binôme.
class LoadingMessage extends StatelessWidget {
  final String message;

  const LoadingMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}