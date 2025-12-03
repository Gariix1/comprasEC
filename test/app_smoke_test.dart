import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/services/environment.dart';
import 'package:compras_ec/core/services/repositories.dart';
import 'package:compras_ec/features/community/domain/community_repository.dart';
import 'package:compras_ec/features/search/domain/search_repository.dart';
import 'package:compras_ec/features/tracking/domain/tracking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App renders navigation destinations without overflow', (tester) async {
    final repos = buildRepositories(Environment.mock);

    await tester.binding.setSurfaceSize(const Size(800, 1200));
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

    expect(find.text('Buscar'), findsOneWidget);
    expect(find.text('Tracker'), findsOneWidget);
    expect(find.text('Comunidad'), findsOneWidget);
    expect(find.text('Config'), findsOneWidget);

    // Ensure no exceptions occurred during first frame
    expect(tester.takeException(), isNull);
  });
}
