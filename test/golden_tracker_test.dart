import 'package:compras_ec/core/services/providers.dart';
import 'package:compras_ec/features/tracking/domain/tracking_event.dart';
import 'package:compras_ec/features/tracking/domain/tracking_repository.dart';
import 'package:compras_ec/features/tracking/presentation/tracking_page.dart';
import 'package:compras_ec/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _GoldenTrackingRepo implements TrackingRepository {
  @override
  Future<List<TrackingEvent>> fetchTrackingEvents(String trackingNumber) async => const [
        TrackingEvent(
          icon: Icons.check_circle,
          iconColor: Colors.green,
          title: 'En tránsito',
          subtitle: 'Salida del país de origen',
          trailing: 'Hoy',
        ),
        TrackingEvent(
          icon: Icons.local_shipping_outlined,
          iconColor: Colors.orange,
          title: 'En aduana',
          subtitle: 'Pendiente de revisión',
          trailing: 'Estimado: 5-8 días',
        ),
      ];
}

void main() {
  testWidgets('Tracker page golden', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    await tester.binding.setSurfaceSize(const Size(430, 1000));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          trackingRepositoryProvider.overrideWithValue(_GoldenTrackingRepo()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          ),
          home: const Scaffold(body: TrackingPage()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(TrackingPage),
      matchesGoldenFile('goldens/tracker_page.png'),
    );
  });
}
