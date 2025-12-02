import 'package:flutter/material.dart';

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
      title: 'Compras EC',
      debugShowCheckedModeBanner: false,
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

    if (wide) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: _onTabSelected,
              extended: isDesktop(context),
              labelType: isTablet(context)
                  ? NavigationRailLabelType.selected
                  : NavigationRailLabelType.none,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.search),
                  label: Text('Buscar'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.local_shipping_outlined),
                  label: Text('Tracker'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.forum_outlined),
                  label: Text('Comunidad'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: Text('Config'),
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
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: _onTabSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_shipping_outlined),
            label: 'Tracker',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            label: 'Comunidad',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Config',
          ),
        ],
      ),
    );
  }
}
