import 'package:compras_ec/core/services/providers.dart';
import 'package:compras_ec/features/search/domain/offer.dart';
import 'package:compras_ec/features/search/domain/search_repository.dart';
import 'package:compras_ec/features/search/presentation/search_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _ErrorSearchRepository implements SearchRepository {
  @override
  Future<List<Offer>> fetchFeatured() async => throw Exception('network error');
}

Widget _build(SearchRepository repo) {
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
  testWidgets('Search shows error state on repo failure without overflow', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(320, 600));
    await tester.pumpWidget(_build(_ErrorSearchRepository()));
    await tester.pumpAndSettle();

    expect(find.text('Ocurrió un error al cargar'), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
