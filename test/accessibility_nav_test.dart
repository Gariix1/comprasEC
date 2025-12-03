import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/services/environment.dart';
import 'package:compras_ec/core/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navigation icons expose semantics labels', (tester) async {
    final overrides = buildOverrides(env: Environment.mock);
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];

    await tester.binding.setSurfaceSize(const Size(800, 900));
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: const ComprasEcApp(),
      ),
    );
    await tester.pumpAndSettle();

    final semantics = tester.ensureSemantics();

    expect(find.bySemanticsLabel('Buscar', skipOffstage: false), findsWidgets);
    expect(find.bySemanticsLabel('Tracker', skipOffstage: false), findsWidgets);
    expect(find.bySemanticsLabel('Comunidad', skipOffstage: false), findsWidgets);
    expect(find.bySemanticsLabel('Config', skipOffstage: false), findsWidgets);

    semantics.dispose();
  });
}
