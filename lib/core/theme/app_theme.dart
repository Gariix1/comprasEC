import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'app_palette.dart';
import 'app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return _baseTheme(AppPalette.lightScheme());
  }

  static ThemeData dark() {
    return _baseTheme(AppPalette.darkScheme());
  }

  static ThemeData fromScheme(ColorScheme scheme) => _baseTheme(scheme);

  static ThemeData _baseTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: const AppBarTheme(centerTitle: false),
      textTheme: AppTypography.textTheme(scheme),
      cardTheme: CardThemeData(
        elevation: 4,
        surfaceTintColor: scheme.surfaceTint,
        color: scheme.surface,
        shadowColor: scheme.shadow.withValues(
          alpha: scheme.shadow.a * 255.0 * 0.2,
        ),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: scheme.surfaceTint,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        showDragHandle: true,
        dragHandleColor: scheme.onSurfaceVariant.withValues(
          alpha: scheme.onSurfaceVariant.a * 255.0 * 0.6,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: scheme.surfaceTint,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        indicatorColor: scheme.primary.withValues(
          alpha: scheme.primary.a * 255.0 * 0.16,
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            final selected = states.contains(WidgetState.selected);
            return IconThemeData(
              color: selected ? scheme.onPrimary : scheme.onSurfaceVariant,
            );
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            return TextStyle(
              color: scheme.onSurfaceVariant,
            );
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return scheme.primary.withValues(
                alpha: scheme.primary.a * 255.0 * 0.14,
              );
            }
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused)) {
              return scheme.primary.withValues(
                alpha: scheme.primary.a * 255.0 * 0.08,
              );
            }
            return null;
          },
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
            transitionType: SharedAxisTransitionType.scaled,
          ),
          TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
        },
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
