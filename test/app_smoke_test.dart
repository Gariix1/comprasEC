import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/services/environment.dart';
import 'package:compras_ec/core/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App renders navigation destinations without overflow', (tester) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];

    await tester.binding.setSurfaceSize(const Size(800, 1200));
    await tester.pumpWidget(
      ProviderScope(
        overrides: buildOverrides(env: Environment.mock),
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
