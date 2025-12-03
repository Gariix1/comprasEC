import 'package:flutter/material.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.loading,
    required this.child,
  });

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!loading) return child;
    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: AbsorbPointer(child: child),
        ),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
