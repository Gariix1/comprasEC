import 'package:compras_ec/core/services/providers.dart';
import 'package:compras_ec/features/search/domain/offer.dart';
import 'package:compras_ec/features/search/domain/search_repository.dart';
import 'package:compras_ec/features/search/presentation/search_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _GoldenSearchRepo implements SearchRepository {
  @override
  Future<List<Offer>> fetchFeatured() async => const [
        Offer(
          title: 'Smartwatch fitness',
          marketplaces: 'Temu • AliExpress • Amazon',
          price: '\$49.99',
        ),
        Offer(
          title: 'Audífonos inalámbricos',
          marketplaces: 'AliExpress • Amazon',
          price: '\$29.90',
        ),
      ];
}

void main() {
  testWidgets('Search page golden', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(600, 1200));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          searchRepositoryProvider.overrideWithValue(_GoldenSearchRepo()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          ),
          home: const Scaffold(body: SearchPage()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(SearchPage),
      matchesGoldenFile('goldens/search_page.png'),
    );
  });
}
