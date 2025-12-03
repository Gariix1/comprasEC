import 'package:flutter/material.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import '../../../core/widgets/app_modal.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showAppContentSheet(
      context: context,
      title: AppLocalizations.of(context)!.settingsProfile,
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
    final l10n = AppLocalizations.of(context)!;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.settingsProfileSubtitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              l10n.settingsConnectAccountsSubtitle,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(l10n.settingsConnectAccounts, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.g_mobiledata, size: 18),
                  label: Text(l10n.settingsConnectGoogle),
                  onPressed: () {
                    // Acción de vincular Google.
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.apple, size: 18),
                  label: Text(l10n.settingsConnectApple),
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
