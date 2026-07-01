import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  testWidgets('YakPrimaryButton renders label and handles tap', (
    WidgetTester tester,
  ) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: YakTheme.light(),
        home: Scaffold(
          body: YakPrimaryButton(
            label: 'Continue',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Continue'), findsOneWidget);

    await tester.tap(find.byType(YakPrimaryButton));
    await tester.pump();

    expect(tapped, isTrue);
  });

  testWidgets('YakPrimaryButton shows loading indicator when isLoading', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YakTheme.light(),
        home: const Scaffold(
          body: YakPrimaryButton(
            label: 'Continue',
            onPressed: null,
            isLoading: true,
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Continue'), findsNothing);
  });
}
