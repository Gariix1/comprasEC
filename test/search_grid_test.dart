import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/services/environment.dart';
import 'package:compras_ec/core/services/repositories.dart';
import 'package:compras_ec/features/community/domain/community_repository.dart';
import 'package:compras_ec/features/search/domain/offer.dart';
import 'package:compras_ec/features/search/domain/search_repository.dart';
import 'package:compras_ec/features/tracking/domain/tracking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('SearchPage builds grid with offers and without overflow', (tester) async {
    // Ensure mock env
    final repos = buildRepositories(Environment.mock);

    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<SearchRepository>.value(value: repos.search),
          Provider<TrackingRepository>.value(value: repos.tracking),
          Provider<CommunityRepository>.value(value: repos.community),
        ],
        child: const ComprasEcApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Should render at least one offer title from mock data
    final offers = await repos.search.fetchFeatured();
    if (offers.isNotEmpty) {
      expect(find.text((offers.first as Offer).title), findsWidgets);
    }
    expect(tester.takeException(), isNull);
  });
}
