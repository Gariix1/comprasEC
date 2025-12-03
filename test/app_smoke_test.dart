import 'package:compras_ec/app.dart';
import 'package:compras_ec/core/localization/strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App renders navigation destinations without overflow', (tester) async {
    await tester.pumpWidget(const ComprasEcApp());
    await tester.pumpAndSettle();

    expect(find.text(Strings.navSearch), findsOneWidget);
    expect(find.text(Strings.navTracking), findsOneWidget);
    expect(find.text(Strings.navCommunity), findsOneWidget);
    expect(find.text(Strings.navSettings), findsOneWidget);

    // Ensure no exceptions occurred during first frame
    expect(tester.takeException(), isNull);
  });
}
