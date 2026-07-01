import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  test('Supernova registry covers all 160 Figma components', () {
    expect(SupernovaComponentRegistry.all.length, 160);
    expect(SupernovaComponentRegistry.widgets.length, greaterThan(100));
  });

  test('find returns widget mapping for Button', () {
    final entry = SupernovaComponentRegistry.find('Button');
    expect(entry?.flutterWidget, 'YakButton');
  });
}
