import 'package:flutter/material.dart';

/// Affiche la jauge de progression du chargement météo.
/// Jauge circulaire animée avec le pourcentage au centre, qui se
/// remplit progressivement à mesure que les villes sont récupérées.
class ProgressSection extends StatelessWidget {
  final double progress;

  const ProgressSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Anneau de progression animé.
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (context, value, _) {
              return SizedBox(
                width: 160,
                height: 160,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 10,
                  backgroundColor: theme.progressIndicatorTheme.linearTrackColor,
                  valueColor: AlwaysStoppedAnimation(
                    theme.progressIndicatorTheme.color,
                  ),
                ),
              );
            },
          ),
          // Pourcentage affiché au centre de la jauge.
          Text(
            "${(progress * 100).round()}%",
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}