import 'package:flutter/material.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/layout.dart';
import 'features/community/presentation/community_page.dart';
import 'features/search/presentation/search_page.dart';
import 'features/settings/presentation/settings_page.dart';
import 'features/tracking/presentation/tracking_page.dart';

class ComprasEcApp extends StatelessWidget {
  const ComprasEcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? 'Compras EC',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supported) {
        if (locale == null) return supported.first;
        return supported.firstWhere(
          (l) => l.languageCode == locale.languageCode,
          orElse: () => supported.first,
        );
      },
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      builder: (context, child) {
        final width = MediaQuery.of(context).size.width;
        final scale = width >= 1024
            ? 1.08
            : width >= 600
                ? 1.04
                : 1.0;
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(scale),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  List<Widget> get _pages => const [
        SearchPage(),
        TrackingPage(),
        CommunityPage(),
        SettingsPage(),
      ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages;
    final currentIndex =
        _currentIndex >= pages.length ? pages.length - 1 : _currentIndex;
    final wide = !isMobile(context);
    final l10n = AppLocalizations.of(context);

    if (wide) {
      return FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: currentIndex,
                onDestinationSelected: _onTabSelected,
                extended: isDesktop(context),
              labelType: isTablet(context)
                  ? NavigationRailLabelType.selected
                  : NavigationRailLabelType.none,
              destinations: [
                NavigationRailDestination(
                  icon: Semantics(
                    container: true,
                    label: l10n?.navSearch ?? 'Buscar',
                    child: const Icon(Icons.search),
                  ),
                  label: Text(l10n?.navSearch ?? 'Buscar'),
                ),
                NavigationRailDestination(
                  icon: Semantics(
                    container: true,
                    label: l10n?.navTracking ?? 'Tracker',
                    child: const Icon(Icons.local_shipping_outlined),
                  ),
                  label: Text(l10n?.navTracking ?? 'Tracker'),
                ),
                NavigationRailDestination(
                  icon: Semantics(
                    container: true,
                    label: l10n?.navCommunity ?? 'Comunidad',
                    child: const Icon(Icons.forum_outlined),
                  ),
                  label: Text(l10n?.navCommunity ?? 'Comunidad'),
                ),
                NavigationRailDestination(
                  icon: Semantics(
                    container: true,
                    label: l10n?.navSettings ?? 'Config',
                    child: const Icon(Icons.settings_outlined),
                  ),
                  label: Text(l10n?.navSettings ?? 'Config'),
                ),
              ],
            ),
              const VerticalDivider(width: 1),
              Expanded(
                child: IndexedStack(
                  index: currentIndex,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: _onTabSelected,
          destinations: [
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navSearch ?? 'Buscar',
                child: const Icon(Icons.search),
              ),
              label: l10n?.navSearch ?? 'Buscar',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navTracking ?? 'Tracker',
                child: const Icon(Icons.local_shipping_outlined),
              ),
              label: l10n?.navTracking ?? 'Tracker',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navCommunity ?? 'Comunidad',
                child: const Icon(Icons.forum_outlined),
              ),
              label: l10n?.navCommunity ?? 'Comunidad',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navSettings ?? 'Config',
                child: const Icon(Icons.settings_outlined),
              ),
              label: l10n?.navSettings ?? 'Config',
            ),
          ],
        ),
      ),
    );
  }
}
