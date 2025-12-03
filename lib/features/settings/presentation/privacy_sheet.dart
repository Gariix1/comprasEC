import 'package:flutter/material.dart';
import '../../../core/widgets/app_modal.dart';

class PrivacySheet extends StatelessWidget {
  const PrivacySheet({super.key});

  static Future<void> show(BuildContext context) {
    return showAppContentSheet(
      context: context,
      title: 'Privacy',
      child: const _PrivacyBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _PrivacyBody();
  }
}

class _PrivacyBody extends StatelessWidget {
  const _PrivacyBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data & activity', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Control data usage, activity logs and permissions here.',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
