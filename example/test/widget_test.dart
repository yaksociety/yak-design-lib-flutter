import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_example/main.dart';

void main() {
  testWidgets('Catalog shows Supernova component index', (tester) async {
    await tester.pumpWidget(const YakDesignCatalogApp());

    expect(find.text('Yak Component Index'), findsOneWidget);
    expect(find.text('Supernova coverage'), findsOneWidget);
    expect(find.text('Flutter widgets'), findsOneWidget);
  });

  testWidgets('Tapping a widget opens only that widget preview', (
    tester,
  ) async {
    await tester.pumpWidget(const YakDesignCatalogApp());

    await tester.tap(find.text('Accordion'));
    await tester.pumpAndSettle();

    expect(find.text('Accordion'), findsWidgets);
    expect(find.text('FAQ'), findsOneWidget);
    expect(find.text('Primary (YakButton)'), findsNothing);
  });
}
