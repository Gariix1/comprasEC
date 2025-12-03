import 'package:compras_ec/core/widgets/app_action_bar.dart';
import 'package:compras_ec/core/widgets/app_button.dart';
import 'package:compras_ec/core/widgets/app_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppSection lays out action in narrow widths without overflow', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 320,
            child: AppSection(
              title: 'Titulo',
              action: AppActionBar(children: [AppButton.secondary(label: 'Accion')]),
              child: Text('Contenido'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Titulo'), findsOneWidget);
    expect(find.text('Accion'), findsOneWidget);
  });
}
