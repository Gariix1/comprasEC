import 'package:flutter/material.dart';
import '../../../core/widgets/app_modal.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

class PrivacySheet extends StatelessWidget {
  const PrivacySheet({super.key});

  static Future<void> show(BuildContext context) {
    return showAppContentSheet(
      context: context,
      title: AppLocalizations.of(context)!.settingsPrivacy,
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
    final l10n = AppLocalizations.of(context)!;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.settingsDataActivityTitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              l10n.settingsDataActivitySubtitle,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
