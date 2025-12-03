import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'section_title.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    super.key,
    required this.title,
    required this.child,
    this.action,
    this.spacing = AppSpacing.sm,
  });

  final String title;
  final Widget child;
  final Widget? action;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 480 && action != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isCompact) ...[
              SectionTitle(title),
              const SizedBox(height: AppSpacing.xs),
              Align(alignment: Alignment.centerRight, child: action),
            ] else ...[
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SectionTitle(title),
                  if (action != null)
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 0, maxWidth: 240),
                      child: action!,
                    ),
                ],
              ),
            ],
            SizedBox(height: spacing),
            child,
          ],
        );
      },
    );
  }
}
