import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_example/main.dart';

void main() {
  testWidgets('Catalog shows Supernova component index', (tester) async {
    await tester.pumpWidget(const YakDesignCatalogApp());

    expect(find.text('Yak Component Index'), findsOneWidget);
    expect(find.text('Supernova coverage'), findsOneWidget);
    expect(find.text('Flutter widgets'), findsOneWidget);
  });
}
