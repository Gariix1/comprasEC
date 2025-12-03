import 'package:flutter/material.dart';

class AppPalette {
  const AppPalette._();

  // Seeds
  static const primarySeed = Color.fromARGB(
    255,
    177,
    207,
    178,
  ); // green for primary actions

  // Gradients
  static const gradientLight = [
    Color(0xFFF8F9FA), // light gray/white
    Color(0xFFECEFF1), // soft gray
  ];

  static const gradientDark = [
    Color(0xFF121212), // near black
    Color(0xFF1E1E1E), // dark gray
  ];

  // Glass overlays
  static const glassLight = Color(0xFFF2F5F7); // neutral light overlay
  static const glassDark = Color(0xFF1A1A1A); // dark overlay

  static ColorScheme lightScheme() => ColorScheme.fromSeed(
        seedColor: primarySeed,
        brightness: Brightness.light,
      );

  static ColorScheme darkScheme() => ColorScheme.fromSeed(
        seedColor: primarySeed,
        brightness: Brightness.dark,
      );
}
