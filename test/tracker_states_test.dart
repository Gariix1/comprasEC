import 'dart:async';

import 'package:compras_ec/core/services/providers.dart';
import 'package:compras_ec/features/tracking/domain/tracking_event.dart';
import 'package:compras_ec/features/tracking/domain/tracking_repository.dart';
import 'package:compras_ec/features/tracking/presentation/tracking_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _LoadingTrackingRepository implements TrackingRepository {
  final Completer<List<TrackingEvent>> _completer = Completer<List<TrackingEvent>>();

  @override
  Future<List<TrackingEvent>> fetchTrackingEvents(String trackingNumber) => _completer.future;
}

class _EmptyTrackingRepository implements TrackingRepository {
  @override
  Future<List<TrackingEvent>> fetchTrackingEvents(String trackingNumber) async => [];
}

Widget _buildTrackingPage(TrackingRepository repo) {
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
  testWidgets('Tracker shows loading overlay while fetching', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(360, 800));
    await tester.pumpWidget(_buildTrackingPage(_LoadingTrackingRepository()));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Tracker shows empty state with no events', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(360, 800));
    await tester.pumpWidget(_buildTrackingPage(_EmptyTrackingRepository()));
    await tester.pumpAndSettle();

    expect(find.text('No hay eventos para este tracking'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Tracker shows validation error on empty input', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(360, 800));
    await tester.pumpWidget(_buildTrackingPage(_EmptyTrackingRepository()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Actualizar estado'));
    await tester.pump();

    expect(find.text('Ingresa un número válido'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
