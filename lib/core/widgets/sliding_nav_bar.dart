import 'dart:math';

import 'package:flutter/material.dart';

import 'clear_glass.dart';

class SlidingNavItem {
  const SlidingNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class SlidingNavBar extends StatelessWidget {
  const SlidingNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<SlidingNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / max(1, items.length);
            final highlightLeft = itemWidth * currentIndex;
            return Container(
              height: 72,
              decoration: BoxDecoration(
                color: scheme.surface,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: scheme.shadow.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                    left: highlightLeft,
                    top: 6,
                    bottom: 6,
                    width: itemWidth,
                    child: Center(
                      child: ClearGlass(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        borderRadius: BorderRadius.circular(14),
                        blur: 10,
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < items.length; i++)
                        Expanded(
                          child: InkResponse(
                            borderRadius: BorderRadius.circular(14),
                            radius: 28,
                            highlightShape: BoxShape.rectangle,
                            onTap: () => onTap(i),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    items[i].icon,
                                    color: i == currentIndex
                                        ? scheme.onPrimary
                                        : scheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    items[i].label,
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          color: scheme.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
