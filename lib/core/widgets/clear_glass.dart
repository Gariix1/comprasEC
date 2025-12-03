import 'dart:ui';

import 'package:flutter/material.dart';

class ClearGlass extends StatelessWidget {
  const ClearGlass({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = const BorderRadius.all(Radius.circular(18)),
    this.blur = 14,
  });

  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double blur;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Slightly darker overlay to improve text/icon contrast on glass.
    final base =
        scheme.surface.withOpacity(scheme.brightness == Brightness.dark ? 0.24 : 0.26);
    final borderColor = scheme.onSurface.withOpacity(0.16);

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: base,
            borderRadius: borderRadius,
            border: Border.all(color: borderColor),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
