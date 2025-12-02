import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    const seed = Color(0xFF0B7C3E);
    final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(centerTitle: false),
      cardTheme: const CardThemeData(surfaceTintColor: Colors.transparent),
    );
  }

  static ThemeData dark() {
    const seed = Color(0xFF4ADE80);
    final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(centerTitle: false),
      cardTheme: const CardThemeData(surfaceTintColor: Colors.transparent),
    );
  }
}
