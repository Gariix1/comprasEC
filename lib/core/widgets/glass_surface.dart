import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'glass_card.dart';

/// Glass container with optional maxWidth to center content on larger screens.
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  final Widget child;
  final double? maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: GlassCard(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
