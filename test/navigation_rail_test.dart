import 'package:compras_ec/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shows NavigationRail on desktop widths', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1300, 800));
    await tester.pumpWidget(const ComprasEcApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
