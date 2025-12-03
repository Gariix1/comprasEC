import 'package:flutter/material.dart';
import '../../../core/widgets/app_modal.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showAppModalSheet(
      context: context,
      builder: (ctx) => const ProfileSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).maybePop(),
                tooltip: 'Close',
              ),
              const SizedBox(width: 4),
              Text('Profile', style: theme.textTheme.titleLarge),
            ],
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account data', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your name, email and preferences here.',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
