import 'package:flutter/material.dart';

import '../tokens/generated/colors.dart';
import '../tokens/generated/text_styles.dart';
import 'yak_theme_mapper.dart';

/// Yak design system themes mapped to Flutter [ThemeData].
abstract final class YakTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: YakThemeMapper.lightColorScheme(),
      scaffoldBackgroundColor: AppColors.backgroundBaseMain,
      extensions: const [YakThemeMapper.lightExtension],
      textTheme: YakThemeMapper.textTheme(AppColors.textIconsBaseMain),
      filledButtonTheme: YakThemeMapper.filledButtonTheme(),
      outlinedButtonTheme: YakThemeMapper.outlinedButtonTheme(),
      textButtonTheme: YakThemeMapper.textButtonTheme(),
      inputDecorationTheme: YakThemeMapper.inputDecorationTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundBaseSecond,
        foregroundColor: AppColors.textIconsBaseMain,
        elevation: 0,
        titleTextStyle: AppTextStyles.headline3Semibold.copyWith(
          color: AppColors.textIconsBaseMain,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: YakThemeMapper.darkColorScheme(),
      scaffoldBackgroundColor: AppColors.backgroundBaseDarkSecond,
      extensions: const [YakThemeMapper.darkExtension],
      textTheme: YakThemeMapper.textTheme(AppColors.textIconsOnColor),
      filledButtonTheme: YakThemeMapper.filledButtonThemeDark(),
      outlinedButtonTheme: YakThemeMapper.outlinedButtonThemeDark(),
      textButtonTheme: YakThemeMapper.textButtonThemeDark(),
      inputDecorationTheme: YakThemeMapper.inputDecorationThemeDark(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundBaseDarkMain,
        foregroundColor: AppColors.textIconsOnColor,
        elevation: 0,
        titleTextStyle: AppTextStyles.headline3Semibold.copyWith(
          color: AppColors.textIconsOnColor,
        ),
      ),
    );
  }
}
