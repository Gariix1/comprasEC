import 'package:compras_ec/core/services/providers.dart';
import 'package:compras_ec/features/tracking/domain/tracking_event.dart';
import 'package:compras_ec/features/tracking/domain/tracking_repository.dart';
import 'package:compras_ec/features/tracking/presentation/tracking_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _ErrorTrackingRepository implements TrackingRepository {
  @override
  Future<List<TrackingEvent>> fetchTrackingEvents(String trackingNumber) async => throw Exception('error');
}

Widget _build(TrackingRepository repo) {
  return ProviderScope(
    overrides: [
      trackingRepositoryProvider.overrideWithValue(repo),
    ],
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Scaffold(
        body: TrackingPage(),
      ),
    ),
  );
}

void main() {
  testWidgets('Tracker shows error state on repo failure without overflow', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(320, 600));
    await tester.pumpWidget(_build(_ErrorTrackingRepository()));
    await tester.pumpAndSettle();

    expect(find.text('Ocurrió un error al cargar el tracking'), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
