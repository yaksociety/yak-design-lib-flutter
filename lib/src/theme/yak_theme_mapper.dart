import 'package:flutter/material.dart';

import '../tokens/generated/dimensions.dart';
import '../tokens/generated/radii.dart';
import '../tokens/generated/semantic_colors.dart';
import '../tokens/generated/text_styles.dart';
import 'yak_theme_extension.dart';

/// Maps Supernova-generated tokens to Flutter theme objects.
///
/// Every color comes from [YakSemanticColors] so Light and Dark follow the
/// Figma "Semantic: Color" collection:
/// - Button / Input heights: S=40, M=44, L=48 (Button XS=36)
/// - Primary fill: Background/Primary-Main, content: Text & Icons/On-Light
/// - Secondary fill: Background/Primary-Second
/// - Danger fill: Background/Danger-Main, content: Text & Icons/On-Dark
/// - Input label: [AppTextStyles.textSMedium]
abstract final class YakThemeMapper {
  static ColorScheme colorScheme(YakSemanticColors c, Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: c.backgroundPrimaryMain,
      onPrimary: c.textIconsOnLight,
      primaryContainer: c.backgroundPrimarySecond,
      onPrimaryContainer: c.textIconsBaseMain,
      secondary: c.backgroundPrimarySecond,
      onSecondary: c.textIconsBaseMain,
      tertiary: c.backgroundBlueMain,
      onTertiary: c.textIconsOnDark,
      error: c.backgroundDangerMain,
      onError: c.textIconsOnDark,
      errorContainer: c.backgroundDangerSecond,
      onErrorContainer: c.textIconsDanger,
      surface: c.backgroundBaseMain,
      onSurface: c.textIconsBaseMain,
      onSurfaceVariant: c.textIconsBaseSecond,
      surfaceContainerLowest: c.backgroundBaseMain,
      surfaceContainerLow: c.backgroundBaseSecond,
      surfaceContainer: c.backgroundBaseSecond,
      surfaceContainerHigh: c.backgroundBaseThird,
      surfaceContainerHighest: c.backgroundBaseThird,
      outline: c.strokeBase,
      outlineVariant: c.strokeBase,
      scrim: c.overlayScrim,
      inverseSurface: c.backgroundBaseDarkMain,
      onInverseSurface: c.textIconsOnDark,
      inversePrimary: c.textIconsPrimary,
    );
  }

  static YakThemeExtension extension(YakSemanticColors c) {
    return YakThemeExtension(
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
      textMain: c.textIconsBaseMain,
      textSecondary: c.textIconsBaseSecond,
      textOnColor: c.textIconsOnDark,
      textDisabled: c.textIconsDisabled,
      borderDefault: c.strokeBase,
      borderFocus: c.strokePrimary,
      borderDanger: c.strokeDanger,
      backgroundMain: c.backgroundBaseMain,
      backgroundSecond: c.backgroundBaseSecond,
      backgroundDisabled: c.backgroundDisabled,
      backgroundPrimary: c.backgroundPrimaryMain,
      backgroundPrimarySecond: c.backgroundPrimarySecond,
      success: c.backgroundSuccessMain,
      warning: c.backgroundWarningMain,
      danger: c.backgroundDangerMain,
    );
  }

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

  static FilledButtonThemeData filledButtonTheme(YakSemanticColors c) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: c.backgroundPrimaryMain,
        foregroundColor: c.textIconsOnLight,
        disabledBackgroundColor: c.backgroundDisabled,
        disabledForegroundColor: c.textIconsDisabled,
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

  static OutlinedButtonThemeData outlinedButtonTheme(YakSemanticColors c) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: c.textIconsBaseMain,
        disabledForegroundColor: c.textIconsDisabled,
        side: BorderSide(color: c.strokeBase),
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

  static TextButtonThemeData textButtonTheme(YakSemanticColors c) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: c.textIconsBaseMain,
        disabledForegroundColor: c.textIconsDisabled,
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

  static InputDecorationTheme inputDecorationTheme(YakSemanticColors c) {
    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: c.backgroundBaseMain,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum16,
        vertical: AppDimensions.mainSystemNum10,
      ),
      border: border(c.strokeBase),
      enabledBorder: border(c.strokeBase),
      disabledBorder: border(c.strokeBase),
      focusedBorder: border(c.strokePrimary, width: 2),
      errorBorder: border(c.strokeDanger),
      focusedErrorBorder: border(c.strokeDanger, width: 2),
      hintStyle: AppTextStyles.textMRegular.copyWith(
        color: c.textIconsBaseSecond,
      ),
      labelStyle: AppTextStyles.textSMedium.copyWith(
        color: c.textIconsBaseMain,
      ),
      errorStyle: AppTextStyles.textSRegular.copyWith(color: c.textIconsDanger),
    );
  }

  static AppBarTheme appBarTheme(YakSemanticColors c) {
    return AppBarTheme(
      backgroundColor: c.backgroundBaseSecond,
      foregroundColor: c.textIconsBaseMain,
      elevation: 0,
      titleTextStyle: AppTextStyles.headline3Semibold.copyWith(
        color: c.textIconsBaseMain,
      ),
    );
  }
}
