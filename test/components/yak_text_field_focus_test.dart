import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  testWidgets('YakTextField loses focus when tapping outside', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YakTheme.light(),
        home: const Scaffold(
          body: Column(
            children: [
              YakTextField(label: 'Name'),
              SizedBox(height: 200, child: Center(child: Text('Outside'))),
            ],
          ),
        ),
      ),
    );

    final field = find.byType(TextField);
    await tester.tap(field);
    await tester.pump();
    expect(tester.widget<TextField>(field).focusNode?.hasFocus, isTrue);
    expect(tester.testTextInput.isVisible, isTrue);

    await tester.tap(find.text('Outside'));
    await tester.pump();
    expect(tester.widget<TextField>(field).focusNode?.hasFocus, isFalse);
    expect(tester.testTextInput.isVisible, isFalse);
  });

  testWidgets('tapping another YakTextField moves focus to it', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YakTheme.light(),
        home: const Scaffold(
          body: Column(
            children: [
              YakTextField(label: 'First'),
              YakTextField(label: 'Second'),
            ],
          ),
        ),
      ),
    );

    final fields = find.byType(TextField);
    await tester.tap(fields.first);
    await tester.pump();
    await tester.tap(fields.last);
    await tester.pump();

    final second = tester.widget<TextField>(fields.last);
    expect(second.focusNode?.hasFocus, isTrue);
    expect(tester.testTextInput.isVisible, isTrue);
  });
}
