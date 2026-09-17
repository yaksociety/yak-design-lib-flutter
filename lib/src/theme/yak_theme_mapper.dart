import 'package:flutter/material.dart';

import '../tokens/generated/colors.dart';
import '../tokens/generated/dimensions.dart';
import '../tokens/generated/radii.dart';
import '../tokens/generated/text_styles.dart';
import 'yak_theme_extension.dart';

/// Maps Supernova-generated tokens to Flutter theme objects.
///
/// Keep this file in sync with component conventions:
/// - Button / Input heights: S=40, M=44, L=48 (Button XS=36)
/// - Primary fill: [AppColors.primary500], text: [AppColors.textIconsBaseMain]
/// - Secondary fill: [AppColors.backgroundPrimarySecond]
/// - Danger text: [AppColors.textIconsOnColor]
/// - Input label: [AppTextStyles.textSMedium]
abstract final class YakThemeMapper {
  static ColorScheme lightColorScheme() {
    return ColorScheme.light(
      primary: AppColors.primary500,
      onPrimary: AppColors.textIconsBaseMain,
      primaryContainer: AppColors.backgroundPrimarySecond,
      onPrimaryContainer: AppColors.textIconsBaseMain,
      secondary: AppColors.backgroundPrimarySecond,
      onSecondary: AppColors.textIconsBaseMain,
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
      onPrimary: AppColors.textIconsBaseMain,
      primaryContainer: AppColors.primary700,
      onPrimaryContainer: AppColors.textIconsBaseMain,
      secondary: AppColors.backgroundPrimarySecond,
      onSecondary: AppColors.textIconsBaseMain,
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
    radiusMd: AppRadii.roundnessRoundOutside,
    radiusLg: AppRadii.roundnessFullOutside,
    heightXs: AppDimensions.mainSystemNum36,
    heightSm: AppDimensions.mainSystemNum40,
    heightMd: AppDimensions.mainSystemNum44,
    heightLg: AppDimensions.mainSystemNum48,
    textMain: AppColors.textIconsBaseMain,
    textSecondary: AppColors.textIconsBaseSecond,
    textOnColor: AppColors.textIconsOnColor,
    textDisabled: AppColors.textIconsDisabled,
    borderDefault: AppColors.strokeBase,
    borderFocus: AppColors.strokePrimary,
    borderDanger: AppColors.strokeDanger,
    backgroundMain: AppColors.backgroundBaseMain,
    backgroundSecond: AppColors.backgroundBaseSecond,
    backgroundDisabled: AppColors.backgroundDisabled,
    backgroundPrimary: AppColors.backgroundPrimaryMain,
    backgroundPrimarySecond: AppColors.backgroundPrimarySecond,
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
    radiusMd: AppRadii.roundnessRoundOutside,
    radiusLg: AppRadii.roundnessFullOutside,
    heightXs: AppDimensions.mainSystemNum36,
    heightSm: AppDimensions.mainSystemNum40,
    heightMd: AppDimensions.mainSystemNum44,
    heightLg: AppDimensions.mainSystemNum48,
    textMain: AppColors.textIconsOnColor,
    textSecondary: AppColors.neutral500,
    textOnColor: AppColors.textIconsOnColor,
    textDisabled: AppColors.textIconsDisabled,
    borderDefault: AppColors.strokeBaseDark,
    borderFocus: AppColors.strokePrimary,
    borderDanger: AppColors.strokeDanger,
    backgroundMain: AppColors.backgroundBaseDarkMain,
    backgroundSecond: AppColors.backgroundBaseDarkSecond,
    backgroundDisabled: AppColors.gray700,
    backgroundPrimary: AppColors.backgroundPrimaryMain,
    backgroundPrimarySecond: AppColors.backgroundPrimarySecond,
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
      labelMedium: AppTextStyles.textSMedium.copyWith(color: defaultColor),
      labelSmall: AppTextStyles.textXSRegular.copyWith(color: defaultColor),
    );
  }

  static FilledButtonThemeData filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.textIconsBaseMain,
        disabledBackgroundColor: AppColors.backgroundDisabled,
        disabledForegroundColor: AppColors.textIconsDisabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum32,
        ),
        minimumSize: const Size(0, AppDimensions.mainSystemNum44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        ),
        textStyle: AppTextStyles.textMSemibold.copyWith(
          color: AppColors.textIconsBaseMain,
        ),
      ),
    );
  }

  static FilledButtonThemeData filledButtonThemeDark() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.textIconsBaseMain,
        disabledBackgroundColor: AppColors.gray700,
        disabledForegroundColor: AppColors.textIconsDisabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSystemNum32,
        ),
        minimumSize: const Size(0, AppDimensions.mainSystemNum44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        ),
        textStyle: AppTextStyles.textMSemibold.copyWith(
          color: AppColors.textIconsBaseMain,
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
        ),
        minimumSize: const Size(0, AppDimensions.mainSystemNum44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
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
        ),
        minimumSize: const Size(0, AppDimensions.mainSystemNum44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
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
        ),
        minimumSize: const Size(0, AppDimensions.mainSystemNum44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
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
        ),
        minimumSize: const Size(0, AppDimensions.mainSystemNum44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        ),
        textStyle: AppTextStyles.textMSemibold,
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: AppColors.backgroundBaseMain,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum16,
        vertical: AppDimensions.mainSystemNum10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokeBase),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokeBase),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokePrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokeDanger),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokeDanger, width: 2),
      ),
      hintStyle: AppTextStyles.textMRegular.copyWith(
        color: AppColors.textIconsBaseSecond,
      ),
      labelStyle: AppTextStyles.textSMedium.copyWith(
        color: AppColors.textIconsBaseMain,
      ),
      errorStyle: AppTextStyles.textSRegular.copyWith(
        color: AppColors.textIconsDanger,
      ),
    );
  }

  static InputDecorationTheme inputDecorationThemeDark() {
    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: AppColors.backgroundBaseDarkMain,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum16,
        vertical: AppDimensions.mainSystemNum10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokeBaseDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokeBaseDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: const BorderSide(color: AppColors.strokePrimary, width: 2),
      ),
      hintStyle: AppTextStyles.textMRegular.copyWith(
        color: AppColors.neutral500,
      ),
      labelStyle: AppTextStyles.textSMedium.copyWith(
        color: AppColors.textIconsOnColor,
      ),
      errorStyle: AppTextStyles.textSRegular.copyWith(
        color: AppColors.textIconsDanger,
      ),
    );
  }
}
