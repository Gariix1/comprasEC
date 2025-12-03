import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

/// Reusable scaffold for modal sheets with close icon, title and body.
class AppModalSheetScaffold extends StatelessWidget {
  const AppModalSheetScaffold({
    super.key,
    this.title,
    this.actions,
    required this.child,
  });

  final String? title;
  final List<Widget>? actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.md),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
              icon: const Icon(Icons.close, size: 24),
              onPressed: () => Navigator.of(context).maybePop(),
              tooltip: 'Close',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 48, top: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.sm),
                ],
                if (actions != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions!,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
