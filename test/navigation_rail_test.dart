import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/services/environment.dart';
import 'package:compras_ec/core/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shows NavigationRail on desktop widths', (tester) async {
    final overrides = buildOverrides(env: Environment.mock);
    await tester.binding.setSurfaceSize(const Size(1300, 800));
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: const ComprasEcApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
