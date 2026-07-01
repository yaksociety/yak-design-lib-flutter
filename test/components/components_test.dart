import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      theme: YakTheme.light(),
      home: Scaffold(body: child),
    );
  }

  testWidgets('YakSecondaryButton renders label', (tester) async {
    await tester.pumpWidget(
      wrap(const YakSecondaryButton(label: 'Back', onPressed: null)),
    );
    expect(find.text('Back'), findsOneWidget);
  });

  testWidgets('YakDestructiveButton renders label', (tester) async {
    await tester.pumpWidget(
      wrap(const YakDestructiveButton(label: 'Delete', onPressed: null)),
    );
    expect(find.text('Delete'), findsOneWidget);
  });

  testWidgets('YakActions shows dual buttons', (tester) async {
    await tester.pumpWidget(
      wrap(
        YakActions(
          primaryLabel: 'Save',
          onPrimaryPressed: () {},
          secondaryLabel: 'Cancel',
          onSecondaryPressed: () {},
        ),
      ),
    );

    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets('YakAlert renders message', (tester) async {
    await tester.pumpWidget(
      wrap(
        const YakAlert(
          message: 'Something happened',
          variant: YakAlertVariant.warning,
        ),
      ),
    );

    expect(find.text('Something happened'), findsOneWidget);
  });

  testWidgets('YakAvatar renders initials', (tester) async {
    await tester.pumpWidget(wrap(const YakAvatar(initials: 'YK')));

    expect(find.text('YK'), findsOneWidget);
  });

  testWidgets('YakBadge renders label', (tester) async {
    await tester.pumpWidget(wrap(const YakBadge(label: 'New')));

    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('YakAccordion expands on tap', (tester) async {
    await tester.pumpWidget(
      wrap(const YakAccordion(title: 'Details', child: Text('Hidden content'))),
    );

    expect(find.text('Hidden content'), findsNothing);
    await tester.tap(find.text('Details'));
    await tester.pumpAndSettle();
    expect(find.text('Hidden content'), findsOneWidget);
  });
}
