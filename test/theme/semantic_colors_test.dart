import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  test('semantic colors match the Figma Light / Dark values', () {
    const light = YakSemanticColors.light;
    const dark = YakSemanticColors.dark;

    expect(light.backgroundBaseMain, const Color(0xFFFFFFFF));
    expect(dark.backgroundBaseMain, const Color(0xFF16181B));
    expect(light.textIconsBaseMain, const Color(0xFF353841));
    expect(dark.textIconsBaseMain, const Color(0xFFFFFFFF));
    expect(light.textIconsDisabled, const Color(0xFFC7C7C7));
    expect(dark.textIconsDisabled, const Color(0xFF5D6067));
    expect(light.textIconsOnLight, dark.textIconsOnLight);
    expect(light.overlayScrim, const Color(0x66000000));
  });

  testWidgets('dark theme exposes dark semantic colors to components', (
    WidgetTester tester,
  ) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        theme: YakTheme.light(),
        darkTheme: YakTheme.dark(),
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (context) {
            captured = context;
            return const Scaffold(body: YakTextField(label: 'Name'));
          },
        ),
      ),
    );

    expect(captured.yakColors.backgroundBaseMain, const Color(0xFF16181B));
    expect(
      captured.yakTheme.textMain,
      YakSemanticColors.dark.textIconsBaseMain,
    );

    final label = tester.widget<Text>(find.text('Name'));
    expect(
      label.textSpan?.style?.color,
      YakSemanticColors.dark.textIconsBaseMain,
    );
  });
}
