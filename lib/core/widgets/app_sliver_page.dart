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
    this.header,
    this.pinnedHeader = false,
    this.headerExtent = 72,
  });

  final List<Widget> slivers;
  final double? maxWidth;
  final EdgeInsets? padding;
  final Widget? header;
  final bool pinnedHeader;
  final double headerExtent;

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

            final paddedSlivers = [
              if (header != null)
                SliverPersistentHeader(
                  pinned: pinnedHeader,
                  delegate: _PinnedHeaderDelegate(
                    extent: headerExtent,
                    padding: effectivePadding,
                    maxWidth: maxWidth,
                    child: header!,
                  ),
                ),
              ...slivers.map(
                (sliver) => SliverPadding(
                  padding: effectivePadding,
                  sliver: sliver,
                ),
              ),
            ];

            return CustomScrollView(slivers: paddedSlivers);
          },
        ),
      ),
    );
  }
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  _PinnedHeaderDelegate({
    required this.extent,
    required this.padding,
    required this.child,
    required this.maxWidth,
  });

  final double extent;
  final EdgeInsets padding;
  final Widget child;
  final double? maxWidth;

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final constrained = maxWidth == null
        ? child
        : Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth!),
              child: child,
            ),
          );

    return Padding(
      padding: padding,
      child: constrained,
    );
  }

  @override
  bool shouldRebuild(covariant _PinnedHeaderDelegate oldDelegate) {
    return extent != oldDelegate.extent ||
        padding != oldDelegate.padding ||
        child != oldDelegate.child ||
        maxWidth != oldDelegate.maxWidth;
  }
}
