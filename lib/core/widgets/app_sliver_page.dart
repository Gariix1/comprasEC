import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'app_background.dart';

/// Scaffold-like container for sliver pages (feeds largos).
class AppSliverPage extends StatelessWidget {
  const AppSliverPage({
    super.key,
    required this.slivers,
    this.maxWidth,
    this.padding,
  });

  final List<Widget> slivers;
  final double? maxWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).padding;
    final basePadding = padding ??
        EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.xl + viewPadding.bottom,
        );

    return AppBackground(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final extraHorizontal = maxWidth == null
                ? 0.0
                : max(0.0, (constraints.maxWidth - maxWidth!) / 2);
            final effectivePadding = basePadding.copyWith(
              left: basePadding.left + extraHorizontal,
              right: basePadding.right + extraHorizontal,
            );

            return CustomScrollView(
              slivers: slivers
                  .map(
                    (sliver) => SliverPadding(
                      padding: effectivePadding,
                      sliver: sliver,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
