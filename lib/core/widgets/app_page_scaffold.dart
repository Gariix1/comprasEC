import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_background.dart';

/// Base scaffold to keep consistent padding, background and safe area handling.
class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.child,
    this.maxWidth,
    this.physics,
    this.alignment = Alignment.topCenter,
    this.padding,
    this.scrollable = true,
  });

  /// Main content widget.
  final Widget child;

  /// Maximum width for the content (helpful on tablet/desktop).
  final double? maxWidth;

  /// Custom scroll physics (defaults to platform scroll).
  final ScrollPhysics? physics;

  /// Alignment inside the scroll view.
  final Alignment alignment;

  /// Extra padding (default uses AppSpacing and accounts for bottom inset).
  final EdgeInsets? padding;

  /// If false, child is rendered without extra scroll (useful for custom scroll views).
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).padding;
    final effectivePadding = padding ??
        EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.xl + viewPadding.bottom,
        );

    return AppBackground(
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final widthConstraint = (maxWidth == null || maxWidth == double.infinity)
                  ? constraints.maxWidth
                  : maxWidth!;

              if (!scrollable) {
                return Padding(
                  padding: effectivePadding,
                  child: Align(
                    alignment: alignment,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: widthConstraint,
                        maxWidth: widthConstraint,
                      ),
                      child: child,
                    ),
                  ),
                );
              }

              return SingleChildScrollView(
                physics: physics,
                padding: effectivePadding,
                child: Align(
                  alignment: alignment,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: widthConstraint,
                      maxWidth: widthConstraint,
                    ),
                    child: child,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
