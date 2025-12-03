import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_section.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final targetWidth = maxWidth == null
            ? constraints.maxWidth
            : maxWidth!.clamp(0, constraints.maxWidth).toDouble();

        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: targetWidth),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: AppSection(
                  title: title,
                  action: action,
                  spacing: spacing,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
