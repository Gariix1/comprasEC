import 'package:flutter/material.dart';
import '../../../core/widgets/app_modal.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showAppContentSheet(
      context: context,
      title: 'Profile',
      child: const _ProfileBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _ProfileBody();
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

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
            Text('Account data', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Manage your name, email and preferences here.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text('Conectar cuentas', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.g_mobiledata, size: 18),
                  label: const Text('Google'),
                  onPressed: () {
                    // Acción de vincular Google.
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.apple, size: 18),
                  label: const Text('Apple ID'),
                  onPressed: () {
                    // Acción de vincular Apple.
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
