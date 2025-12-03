import 'package:flutter/material.dart';

import '../../../core/localization/strings.dart';
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
    final maxWidth = maxContentWidth(context);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: [
          GlassSurface(
            maxWidth: maxWidth,
            child: const AppSection(
              title: Strings.settingsAppearance,
              spacing: AppSpacing.sm,
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.brightness_6_outlined,
                    title: Strings.settingsTheme,
                    subtitle: Strings.settingsThemeSubtitle,
                  ),
                  _SettingTile(
                    icon: Icons.color_lens_outlined,
                    title: Strings.settingsAccent,
                    subtitle: Strings.settingsAccentSubtitle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          GlassSurface(
            maxWidth: maxWidth,
            child: const AppSection(
              title: Strings.settingsNotifications,
              spacing: AppSpacing.sm,
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.local_offer_outlined,
                    title: Strings.settingsOffersAlerts,
                    subtitle: Strings.settingsOffersSubtitle,
                  ),
                  _SettingTile(
                    icon: Icons.local_shipping_outlined,
                    title: Strings.settingsShippingAlerts,
                    subtitle: Strings.settingsShippingSubtitle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          GlassSurface(
            maxWidth: maxWidth,
            child: AppSection(
              title: Strings.settingsAccount,
              spacing: AppSpacing.sm,
              action: const AppButton.secondary(
                label: Strings.settingsEditProfile,
                icon: Icons.edit_outlined,
              ),
              child: const Column(
                children: [
                  _SettingTile(
                    icon: Icons.person_outline,
                    title: Strings.settingsProfile,
                    subtitle: Strings.settingsProfileSubtitle,
                  ),
                  _SettingTile(
                    icon: Icons.security_outlined,
                    title: Strings.settingsPrivacy,
                    subtitle: Strings.settingsPrivacySubtitle,
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
