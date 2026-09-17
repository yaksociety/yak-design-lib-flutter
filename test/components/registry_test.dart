import 'package:flutter_test/flutter_test.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  test('Supernova registry covers all 157 Figma components', () {
    expect(SupernovaComponentRegistry.all.length, 157);
    expect(SupernovaComponentRegistry.widgets.length, greaterThan(100));
  });

  test('find returns widget mapping for Button', () {
    final entry = SupernovaComponentRegistry.find('Button');
    expect(entry?.flutterWidget, 'YakButton');
  });

  test('findById returns entry for known Figma id', () {
    final byName = SupernovaComponentRegistry.find('Button');
    final byId = SupernovaComponentRegistry.findById(byName!.supernovaId);
    expect(byId?.supernovaName, 'Button');
    expect(byId?.flutterWidget, 'YakButton');
  });

  test('duplicate names keep distinct ids', () {
    final ratings = SupernovaComponentRegistry.all
        .where((e) => e.supernovaName == 'Rating')
        .toList();
    expect(ratings.length, 3);
    expect(ratings.map((e) => e.supernovaId).toSet().length, 3);
  });
}
