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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SectionTitle(title),
            const Spacer(),
            if (action != null) action!,
          ],
        ),
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}
