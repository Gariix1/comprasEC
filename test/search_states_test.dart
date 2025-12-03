import 'dart:async';

import 'package:compras_ec/core/services/providers.dart';
import 'package:compras_ec/core/widgets/app_action_bar.dart';
import 'package:compras_ec/core/widgets/app_button.dart';
import 'package:compras_ec/features/search/domain/offer.dart';
import 'package:compras_ec/features/search/domain/search_repository.dart';
import 'package:compras_ec/features/search/presentation/search_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _LoadingSearchRepository implements SearchRepository {
  final Completer<List<Offer>> _completer = Completer<List<Offer>>();

  @override
  Future<List<Offer>> fetchFeatured() => _completer.future;
}

class _EmptySearchRepository implements SearchRepository {
  @override
  Future<List<Offer>> fetchFeatured() async => [];
}

Widget _buildSearchPage(SearchRepository repo) {
  return ProviderScope(
    overrides: [
      searchRepositoryProvider.overrideWithValue(repo),
    ],
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Scaffold(
        body: SearchPage(),
      ),
    ),
  );
}

void main() {
  testWidgets('Search shows loading overlay while fetching', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(360, 800));
    final repo = _LoadingSearchRepository();

    await tester.pumpWidget(_buildSearchPage(repo));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Search shows empty state when there are no offers', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(360, 800));
    await tester.pumpWidget(_buildSearchPage(_EmptySearchRepository()));
    await tester.pumpAndSettle();

    expect(find.text('No hay resultados aún. Prueba otra búsqueda o crea una alerta.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('AppActionBar wraps buttons on narrow widths', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(260, 200));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 240,
              child: AppActionBar(
                children: [
                  AppButton.secondary(label: 'Crear alerta', icon: Icons.notifications_outlined),
                  AppButton.primary(label: 'Filtrar', icon: Icons.filter_list),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Crear alerta'), findsOneWidget);
    expect(find.text('Filtrar'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
