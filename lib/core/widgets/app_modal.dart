import 'package:flutter/material.dart';

/// Helper to show a modal bottom sheet with consistent M3 shape/drag handle.
Future<T?> showAppModalSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool useRootNavigator = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    showDragHandle: true,
    isDismissible: true,
    enableDrag: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) {
      final media = MediaQuery.of(ctx);
      return Padding(
        padding: EdgeInsets.only(
          bottom: media.viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // Slightly shorter to reduce drag distance required to close.
              minHeight: media.size.height * 0.88,
              maxHeight: media.size.height * 0.96,
            ),
            child: builder(ctx),
          ),
        ),
      );
    },
  );
}
