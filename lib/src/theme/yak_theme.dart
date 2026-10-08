import 'package:flutter/material.dart';

import '../tokens/generated/semantic_colors.dart';
import 'yak_theme_mapper.dart';

/// Yak design system themes mapped to Flutter [ThemeData].
///
/// Install once on [MaterialApp]:
/// ```dart
/// MaterialApp(
///   theme: YakTheme.light(),
///   darkTheme: YakTheme.dark(),
/// )
/// ```
///
/// Then read tokens via Yak Society Context:
/// `context.yakColors`, `context.yakTheme`, `context.yakColorScheme`,
/// `context.yakTextTheme`.
abstract final class YakTheme {
  static ThemeData light() =>
      fromSemanticColors(YakSemanticColors.light, Brightness.light);

  static ThemeData dark() =>
      fromSemanticColors(YakSemanticColors.dark, Brightness.dark);

  static ThemeData fromSemanticColors(
    YakSemanticColors colors,
    Brightness brightness,
  ) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: YakThemeMapper.colorScheme(colors, brightness),
      scaffoldBackgroundColor: colors.backgroundBaseMain,
      dividerColor: colors.strokeBase,
      extensions: [colors, YakThemeMapper.extension(colors)],
      textTheme: YakThemeMapper.textTheme(colors.textIconsBaseMain),
      filledButtonTheme: YakThemeMapper.filledButtonTheme(colors),
      outlinedButtonTheme: YakThemeMapper.outlinedButtonTheme(colors),
      textButtonTheme: YakThemeMapper.textButtonTheme(colors),
      inputDecorationTheme: YakThemeMapper.inputDecorationTheme(colors),
      appBarTheme: YakThemeMapper.appBarTheme(colors),
    );
  }
}
