import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_section.dart';
import 'glass_surface.dart';

/// Wrapper that combines GlassSurface + AppSection + Column children.
class SectionListBlock extends StatelessWidget {
  const SectionListBlock({
    super.key,
    required this.title,
    required this.children,
    this.maxWidth,
    this.spacing = AppSpacing.sm,
    this.action,
    this.padding,
  });

  final String title;
  final List<Widget> children;
  final double? maxWidth;
  final double spacing;
  final Widget? action;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      maxWidth: maxWidth,
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      child: AppSection(
        title: title,
        action: action,
        spacing: spacing,
        child: Column(
          children: children
              .map(
                (w) => Padding(
                  padding: EdgeInsets.only(bottom: w == children.last ? 0 : spacing),
                  child: w,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
