import 'package:flutter/material.dart';

import '../tokens/generated/colors.dart';
import '../tokens/generated/dimensions.dart';
import '../tokens/generated/radii.dart';
import '../tokens/generated/text_styles.dart';
import 'yak_theme_extension.dart';

/// Maps Supernova-generated tokens to Flutter theme objects.
///
/// Update token references here after each Supernova sync if names change.
abstract final class YakThemeMapper {
  static ColorScheme lightColorScheme() {
    return ColorScheme.light(
      primary: AppColors.primary500,
      onPrimary: AppColors.textIconsOnColor,
      primaryContainer: AppColors.primary600,
      onPrimaryContainer: AppColors.textIconsOnColor,
      secondary: AppColors.gray500,
      onSecondary: AppColors.textIconsOnColor,
      surface: AppColors.backgroundBaseMain,
      onSurface: AppColors.textIconsBaseMain,
      onSurfaceVariant: AppColors.textIconsBaseSecond,
      error: AppColors.danger500,
      onError: AppColors.textIconsOnColor,
      outline: AppColors.strokeBase,
      surfaceContainerHighest: AppColors.backgroundBaseThird,
    );
  }

  static ColorScheme darkColorScheme() {
    return ColorScheme.dark(
      primary: AppColors.primary500,
      onPrimary: AppColors.textIconsOnColor,
      primaryContainer: AppColors.primary700,
      onPrimaryContainer: AppColors.textIconsOnColor,
      secondary: AppColors.gray400,
      onSecondary: AppColors.textIconsOnColor,
      surface: AppColors.backgroundBaseDarkMain,
      onSurface: AppColors.textIconsOnColor,
      onSurfaceVariant: AppColors.neutral500,
      error: AppColors.danger500,
      onError: AppColors.textIconsOnColor,
      outline: AppColors.strokeBaseDark,
      surfaceContainerHighest: AppColors.backgroundBaseDarkSecond,
    );
  }

  static const YakThemeExtension lightExtension = YakThemeExtension(
    spacingXs: AppDimensions.mainSystemNum4,
    spacingSm: AppDimensions.mainSystemNum8,
    spacingMd: AppDimensions.mainSystemNum16,
    spacingLg: AppDimensions.mainSystemNum24,
    spacingXl: AppDimensions.mainSystemNum32,
    radiusSm: AppRadii.roundnessSquareOutside,
    radiusMd: AppRadii.roundnessRoundInside,
    radiusLg: AppRadii.roundnessFullOutside,
    textSecondary: AppColors.textIconsBaseSecond,
    borderDefault: AppColors.strokeBase,
    success: AppColors.success500,
    warning: AppColors.warning500,
    danger: AppColors.danger500,
  );

  static const YakThemeExtension darkExtension = YakThemeExtension(
    spacingXs: AppDimensions.mainSystemNum4,
    spacingSm: AppDimensions.mainSystemNum8,
    spacingMd: AppDimensions.mainSystemNum16,
    spacingLg: AppDimensions.mainSystemNum24,
    spacingXl: AppDimensions.mainSystemNum32,
    radiusSm: AppRadii.roundnessSquareOutside,
    radiusMd: AppRadii.roundnessRoundInside,
    radiusLg: AppRadii.roundnessFullOutside,
    textSecondary: AppColors.neutral500,
    borderDefault: AppColors.strokeBaseDark,
    success: AppColors.success500,
    warning: AppColors.warning500,
    danger: AppColors.danger500,
  );

  static TextTheme textTheme(Color defaultColor) {
    return TextTheme(
      headlineMedium: AppTextStyles.headline1Semibold.copyWith(
        color: defaultColor,
      ),
      titleLarge: AppTextStyles.headline2Semibold.copyWith(color: defaultColor),
      titleMedium: AppTextStyles.headline3Semibold.copyWith(
        color: defaultColor,
      ),
      bodyLarge: AppTextStyles.textLRegular.copyWith(color: defaultColor),
      bodyMedium: AppTextStyles.textMRegular.copyWith(color: defaultColor),
      bodySmall: AppTextStyles.textSRegular.copyWith(color: defaultColor),
      labelLarge: AppTextStyles.textMSemibold.copyWith(color: defaultColor),
      labelSmall: AppTextStyles.textXSRegular.copyWith(color: defaultColor),
    );
  }

  static FilledButtonThemeData filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.textIconsOnColor,
        disabledBackgroundColor: AppColors.backgroundDisabled,
        disabledForegroundColor: AppColors.textIconsDisabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum32,
          vertical: AppDimensions.mainSystemNum16,
        ),
        textStyle: AppTextStyles.textMSemibold.copyWith(
          color: AppColors.textIconsOnColor,
        ),
      ),
    );
  }

  static FilledButtonThemeData filledButtonThemeDark() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.textIconsOnColor,
        disabledBackgroundColor: AppColors.gray700,
        disabledForegroundColor: AppColors.textIconsDisabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum32,
          vertical: AppDimensions.mainSystemNum16,
        ),
        textStyle: AppTextStyles.textMSemibold.copyWith(
          color: AppColors.textIconsOnColor,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textIconsBaseMain,
        disabledForegroundColor: AppColors.textIconsDisabled,
        side: const BorderSide(color: AppColors.strokeBase),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum32,
          vertical: AppDimensions.mainSystemNum16,
        ),
        textStyle: AppTextStyles.textMSemibold,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonThemeDark() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textIconsOnColor,
        disabledForegroundColor: AppColors.textIconsDisabled,
        side: const BorderSide(color: AppColors.strokeBaseDark),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum32,
          vertical: AppDimensions.mainSystemNum16,
        ),
        textStyle: AppTextStyles.textMSemibold,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textIconsBaseMain,
        disabledForegroundColor: AppColors.textIconsDisabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum16,
          vertical: AppDimensions.mainSystemNum12,
        ),
        textStyle: AppTextStyles.textMSemibold,
      ),
    );
  }

  static TextButtonThemeData textButtonThemeDark() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textIconsOnColor,
        disabledForegroundColor: AppColors.textIconsDisabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum16,
          vertical: AppDimensions.mainSystemNum12,
        ),
        textStyle: AppTextStyles.textMSemibold,
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundBaseSecond,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum16,
        vertical: AppDimensions.mainSystemNum12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokeBase),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokeBase),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokePrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokeDanger),
      ),
      hintStyle: AppTextStyles.textMRegular.copyWith(
        color: AppColors.textIconsBaseSecond,
      ),
    );
  }

  static InputDecorationTheme inputDecorationThemeDark() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundBaseDarkMain,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum16,
        vertical: AppDimensions.mainSystemNum12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokeBaseDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokeBaseDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessSquareOutside),
        borderSide: const BorderSide(color: AppColors.strokePrimary, width: 2),
      ),
      hintStyle: AppTextStyles.textMRegular.copyWith(
        color: AppColors.neutral500,
      ),
    );
  }
}
