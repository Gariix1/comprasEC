import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(ColorScheme scheme) {
    // Use the bundled Roboto from Flutter to avoid runtime font fetching.
    final base = ThemeData(fontFamily: 'Roboto').textTheme;
    return base.copyWith(
      titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
