import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:compras_ec/l10n/app_localizations.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/layout.dart';
import 'features/community/presentation/community_page.dart';
import 'features/search/presentation/search_page.dart';
import 'features/settings/presentation/settings_page.dart';
import 'features/tracking/presentation/tracking_page.dart';
import 'features/services/presentation/connected_services_page.dart';
import 'core/services/theme_controller.dart';
import 'core/services/locale_controller.dart';

class ComprasEcApp extends ConsumerWidget {
  const ComprasEcApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final lightTheme = AppTheme.light();
    final darkTheme = AppTheme.dark();

    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? 'Compras EC',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      localeResolutionCallback: (locale, supported) {
        if (locale == null) return supported.first;
        return supported.firstWhere(
          (l) => l.languageCode == locale.languageCode,
          orElse: () => supported.first,
        );
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
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
        TrackingPage(),
        ConnectedServicesPage(),
        SearchPage(),
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

    final pageTransition = AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          fit: StackFit.expand,
          children: [
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
      child: KeyedSubtree(
        key: ValueKey<int>(currentIndex),
        child: pages[currentIndex],
      ),
    );

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
                      label: l10n?.navTracking ?? 'Tracker',
                      child: BouncyIcon(
                        icon: Icons.local_shipping_outlined,
                        isSelected: currentIndex == 0,
                      ),
                    ),
                    label: Text(l10n?.navTracking ?? 'Tracker'),
                  ),
                  NavigationRailDestination(
                    icon: Semantics(
                      container: true,
                      label: l10n?.navServices ?? 'Servicios',
                      child: BouncyIcon(
                        icon: Icons.link_outlined,
                        isSelected: currentIndex == 1,
                      ),
                    ),
                    label: Text(l10n?.navServices ?? 'Servicios'),
                  ),
                  NavigationRailDestination(
                    icon: Semantics(
                      container: true,
                      label: l10n?.navSearch ?? 'Buscar',
                      child: BouncyIcon(
                        icon: Icons.search,
                        isSelected: currentIndex == 2,
                      ),
                    ),
                    label: Text(l10n?.navSearch ?? 'Buscar'),
                  ),
                  NavigationRailDestination(
                    icon: Semantics(
                      container: true,
                      label: l10n?.navCommunity ?? 'Comunidad',
                      child: BouncyIcon(
                        icon: Icons.forum_outlined,
                        isSelected: currentIndex == 3,
                      ),
                    ),
                    label: Text(l10n?.navCommunity ?? 'Comunidad'),
                  ),
                  NavigationRailDestination(
                    icon: Semantics(
                      container: true,
                      label: l10n?.navSettings ?? 'Config',
                      child: BouncyIcon(
                        icon: Icons.settings_outlined,
                        isSelected: currentIndex == 4,
                      ),
                    ),
                    label: Text(l10n?.navSettings ?? 'Config'),
                  ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: pageTransition,
              ),
            ],
          ),
        ),
      );
    }

    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: Scaffold(
        body: pageTransition,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: _onTabSelected,
          destinations: [
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navTracking ?? 'Tracker',
                child: BouncyIcon(
                  icon: Icons.local_shipping_outlined,
                  isSelected: currentIndex == 0,
                ),
              ),
              label: l10n?.navTracking ?? 'Tracker',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navServices ?? 'Servicios',
                child: BouncyIcon(
                  icon: Icons.link_outlined,
                  isSelected: currentIndex == 1,
                ),
              ),
              label: l10n?.navServices ?? 'Servicios',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navSearch ?? 'Buscar',
                child: BouncyIcon(
                  icon: Icons.search,
                  isSelected: currentIndex == 2,
                ),
              ),
              label: l10n?.navSearch ?? 'Buscar',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navCommunity ?? 'Comunidad',
                child: BouncyIcon(
                  icon: Icons.forum_outlined,
                  isSelected: currentIndex == 3,
                ),
              ),
              label: l10n?.navCommunity ?? 'Comunidad',
            ),
            NavigationDestination(
              icon: Semantics(
                container: true,
                label: l10n?.navSettings ?? 'Config',
                child: BouncyIcon(
                  icon: Icons.settings_outlined,
                  isSelected: currentIndex == 4,
                ),
              ),
              label: l10n?.navSettings ?? 'Config',
            ),
          ],
        ),
      ),
    );
  }
}

class BouncyIcon extends StatefulWidget {
  const BouncyIcon({
    super.key,
    required this.icon,
    required this.isSelected,
  });

  final IconData icon;
  final bool isSelected;

  @override
  State<BouncyIcon> createState() => _BouncyIconState();
}

class _BouncyIconState extends State<BouncyIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    if (widget.isSelected) {
      _controller.value = _controller.upperBound;
    }
  }

  @override
  void didUpdateWidget(BouncyIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !oldWidget.isSelected) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Icon(widget.icon),
    );
  }
}
