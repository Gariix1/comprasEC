import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final scheme =
        ColorScheme.fromSeed(seedColor: AppColors.seedLight, brightness: Brightness.light);
    return _baseTheme(scheme);
  }

  static ThemeData dark() {
    final scheme =
        ColorScheme.fromSeed(seedColor: AppColors.seedDark, brightness: Brightness.dark);
    return _baseTheme(scheme);
  }

  static ThemeData _baseTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(centerTitle: false),
      textTheme: AppTypography.textTheme(scheme),
      cardTheme: const CardThemeData(surfaceTintColor: Colors.transparent),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: scheme.primary.withOpacity(0.16),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
