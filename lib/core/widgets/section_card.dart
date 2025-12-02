import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_section.dart';
import 'glass_surface.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.child,
    this.action,
    this.spacing = AppSpacing.sm,
    this.maxWidth,
  });

  final String title;
  final Widget child;
  final Widget? action;
  final double spacing;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      maxWidth: maxWidth,
      child: AppSection(
        title: title,
        action: action,
        spacing: spacing,
        child: child,
      ),
    );
  }
}
