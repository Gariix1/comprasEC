import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/app_list_tile.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/section_list_block.dart';
import '../../../core/services/theme_controller.dart';
import '../../../core/services/locale_controller.dart';
import '../../../core/widgets/app_modal.dart';
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
    final locale = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);

    return AppPageScaffold(
      maxWidth: maxWidth,
      child: Column(
        children: [
          SectionListBlock(
            maxWidth: maxWidth,
            title: l10n.settingsAccount,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: const Icon(Icons.person, size: 32),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.settingsUserName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xxs,
                children: [
                  Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    avatar: const Icon(Icons.g_mobiledata, size: 16),
                    label: Text(l10n.settingsLinkedGoogle),
                  ),
                  Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    avatar: const Icon(Icons.apple, size: 16),
                    label: Text(l10n.settingsLinkedApple),
                  ),
                ],
              ),
              AppListTile(
                icon: Icons.person_outline,
                title: l10n.settingsProfile,
                subtitle: l10n.settingsProfileSubtitle,
                trailing: const SizedBox.shrink(),
                onTap: () => ProfileSheet.show(context),
              ),
              AppListTile(
                icon: Icons.security_outlined,
                title: l10n.settingsPrivacy,
                subtitle: l10n.settingsPrivacySubtitle,
                trailing: const SizedBox.shrink(),
                onTap: () => PrivacySheet.show(context),
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
                      label: Text(l10n.settingsThemeLight),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      icon: const Icon(Icons.dark_mode),
                      label: Text(l10n.settingsThemeDark),
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
              AppListTile(
                icon: Icons.language,
                title: l10n.settingsLanguage,
                subtitle: locale?.languageCode == 'en'
                    ? l10n.settingsLanguageEnglish
                    : locale?.languageCode == 'es'
                        ? l10n.settingsLanguageSpanish
                        : l10n.settingsLanguageSystem,
                trailing: const SizedBox.shrink(),
                onTap: () async {
                  await showAppContentSheet(
                    context: context,
                    title: l10n.settingsLanguage,
                    child: _LanguageSheet(
                      current: locale,
                      onSelect: (loc) => localeNotifier.setLocale(loc),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LanguageSheet extends StatefulWidget {
  const _LanguageSheet({required this.current, required this.onSelect});

  final Locale? current;
  final ValueChanged<Locale?> onSelect;

  @override
  State<_LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<_LanguageSheet> {
  Locale? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.current;
  }

  void _update(Locale? value) {
    setState(() => _selected = value);
    widget.onSelect(value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<Locale?>(
          value: null,
          groupValue: _selected,
          title: Text(l10n.settingsLanguageSystem),
          onChanged: _update,
        ),
        RadioListTile<Locale?>(
          value: const Locale('es'),
          groupValue: _selected,
          title: Text(l10n.settingsLanguageSpanish),
          onChanged: _update,
        ),
        RadioListTile<Locale?>(
          value: const Locale('en'),
          groupValue: _selected,
          title: Text(l10n.settingsLanguageEnglish),
          onChanged: _update,
        ),
      ],
    );
  }
}
