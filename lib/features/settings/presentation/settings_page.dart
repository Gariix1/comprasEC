import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_list_tile.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/section_list_block.dart';
import '../../../core/services/theme_controller.dart';
import 'profile_sheet.dart';
import 'privacy_sheet.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final maxWidth = maxContentWidth(context);
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: [
          SectionListBlock(
            maxWidth: maxWidth,
            title: l10n.settingsAppearance,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                child: SegmentedButton<ThemeMode>(
                  segments: [
                    ButtonSegment(
                      value: ThemeMode.system,
                      icon: const Icon(Icons.auto_mode),
                      label: Text(l10n.settingsTheme),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      icon: const Icon(Icons.light_mode),
                      label: const Text('Light'),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      icon: const Icon(Icons.dark_mode),
                      label: const Text('Dark'),
                    ),
                  ],
                  selected: {themeMode},
                  onSelectionChanged: (values) {
                    if (values.isNotEmpty) {
                      themeNotifier.setMode(values.first);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          SectionListBlock(
            maxWidth: maxWidth,
            title: l10n.settingsNotifications,
            children: [
              AppListTile(
                icon: Icons.local_offer_outlined,
                title: l10n.settingsOffersAlerts,
                subtitle: l10n.settingsOffersSubtitle,
              ),
              AppListTile(
                icon: Icons.local_shipping_outlined,
                title: l10n.settingsShippingAlerts,
                subtitle: l10n.settingsShippingSubtitle,
              ),
            ],
            action: Wrap(
              spacing: AppSpacing.xs,
              children: [
                ActionChip(
                  label: Text(l10n.settingsOffersAlerts),
                  onPressed: () => ProfileSheet.show(context),
                ),
                ActionChip(
                  label: Text(l10n.settingsShippingAlerts),
                  onPressed: () => ProfileSheet.show(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SectionListBlock(
            maxWidth: maxWidth,
            title: l10n.settingsAccount,
            action: ActionChip(
              label: Text(l10n.settingsEditProfile),
              avatar: const Icon(Icons.edit_outlined, size: 18),
              onPressed: () => ProfileSheet.show(context),
            ),
            children: [
              AppListTile(
                icon: Icons.person_outline,
                title: l10n.settingsProfile,
                subtitle: l10n.settingsProfileSubtitle,
                onTap: () => ProfileSheet.show(context),
              ),
              AppListTile(
                icon: Icons.security_outlined,
                title: l10n.settingsPrivacy,
                subtitle: l10n.settingsPrivacySubtitle,
                onTap: () => PrivacySheet.show(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
