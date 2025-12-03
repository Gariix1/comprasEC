import 'dart:async';

import 'package:compras_ec/features/tracking/domain/tracking_event.dart';
import 'package:compras_ec/features/tracking/domain/tracking_repository.dart';
import 'package:compras_ec/features/tracking/presentation/tracking_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

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
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: Provider<TrackingRepository>.value(
        value: repo,
        child: const TrackingPage(),
      ),
    ),
  );
}

void main() {
  testWidgets('Tracker shows loading overlay while fetching', (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));
    await tester.pumpWidget(_buildTrackingPage(_LoadingTrackingRepository()));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Tracker shows empty state with no events', (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));
    await tester.pumpWidget(_buildTrackingPage(_EmptyTrackingRepository()));
    await tester.pumpAndSettle();

    expect(find.text('No hay eventos para este tracking'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
