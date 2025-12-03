import 'package:flutter/material.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_list_tile.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/section_list_block.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: [
          SectionListBlock(
            maxWidth: maxWidth,
            title: l10n.settingsAppearance,
            children: [
              AppListTile(
                icon: Icons.brightness_6_outlined,
                title: l10n.settingsTheme,
                subtitle: l10n.settingsThemeSubtitle,
              ),
              AppListTile(
                icon: Icons.color_lens_outlined,
                title: l10n.settingsAccent,
                subtitle: l10n.settingsAccentSubtitle,
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
          ),
          const SizedBox(height: AppSpacing.sm),
          SectionListBlock(
            maxWidth: maxWidth,
            title: l10n.settingsAccount,
            action: AppButton.secondary(
              label: l10n.settingsEditProfile,
              icon: Icons.edit_outlined,
            ),
            children: [
              AppListTile(
                icon: Icons.person_outline,
                title: l10n.settingsProfile,
                subtitle: l10n.settingsProfileSubtitle,
              ),
              AppListTile(
                icon: Icons.security_outlined,
                title: l10n.settingsPrivacy,
                subtitle: l10n.settingsPrivacySubtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
