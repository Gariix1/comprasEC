import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
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

  final _pages = const [
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
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
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
