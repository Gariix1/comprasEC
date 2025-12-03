import 'package:flutter/material.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/glass_surface.dart';

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
          GlassSurface(
            maxWidth: maxWidth,
            child: AppSection(
              title: l10n.settingsAppearance,
              spacing: AppSpacing.sm,
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.brightness_6_outlined,
                    title: l10n.settingsTheme,
                    subtitle: l10n.settingsThemeSubtitle,
                  ),
                  _SettingTile(
                    icon: Icons.color_lens_outlined,
                    title: l10n.settingsAccent,
                    subtitle: l10n.settingsAccentSubtitle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          GlassSurface(
            maxWidth: maxWidth,
            child: AppSection(
              title: l10n.settingsNotifications,
              spacing: AppSpacing.sm,
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.local_offer_outlined,
                    title: l10n.settingsOffersAlerts,
                    subtitle: l10n.settingsOffersSubtitle,
                  ),
                  _SettingTile(
                    icon: Icons.local_shipping_outlined,
                    title: l10n.settingsShippingAlerts,
                    subtitle: l10n.settingsShippingSubtitle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          GlassSurface(
            maxWidth: maxWidth,
            child: AppSection(
              title: l10n.settingsAccount,
              spacing: AppSpacing.sm,
              action: AppButton.secondary(
                label: l10n.settingsEditProfile,
                icon: Icons.edit_outlined,
              ),
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.person_outline,
                    title: l10n.settingsProfile,
                    subtitle: l10n.settingsProfileSubtitle,
                  ),
                  _SettingTile(
                    icon: Icons.security_outlined,
                    title: l10n.settingsPrivacy,
                    subtitle: l10n.settingsPrivacySubtitle,
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

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
