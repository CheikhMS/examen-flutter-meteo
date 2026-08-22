// widgets/progress_section.dart

import 'package:flutter/material.dart';

/// Affiche la jauge de progression du chargement météo.
/// NOTE : version temporaire, à animer/styliser par la partie UI du binôme.
class ProgressSection extends StatelessWidget {
  final double progress;

  const ProgressSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: progress);
  }
}