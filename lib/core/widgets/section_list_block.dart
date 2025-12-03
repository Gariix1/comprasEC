import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_section.dart';

/// Wrapper that combines a centered card + AppSection + Column children.
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
              ),
            ),
          ),
        );
      },
    );
  }
}
