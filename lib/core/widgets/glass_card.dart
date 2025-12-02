import 'package:flutter/material.dart';

import 'clear_glass.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ClearGlass(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
