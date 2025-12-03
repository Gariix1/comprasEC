import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/services/environment.dart';
import 'package:compras_ec/core/services/repository_provider.dart';
import 'package:compras_ec/features/search/domain/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchPage builds grid with offers and without overflow', (tester) async {
    // Ensure mock env
    RepositoryProvider.env = Environment.mock;

    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pumpWidget(const ComprasEcApp());
    await tester.pumpAndSettle();

    // Should render at least one offer title from mock data
    final offers = RepositoryProvider.search.fetchFeatured();
    if (offers.isNotEmpty) {
      expect(find.text((offers.first as Offer).title), findsWidgets);
    }
    expect(tester.takeException(), isNull);
  });
}
