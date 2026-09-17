import 'package:flutter/material.dart';

/// Semantic Yak design tokens exposed via [ThemeExtension].
///
/// Values come from Supernova via [YakThemeMapper]. Prefer
/// `context.yakTheme` in components instead of hard-coded [AppColors].
@immutable
class YakThemeExtension extends ThemeExtension<YakThemeExtension> {
  const YakThemeExtension({
    required this.spacingXs,
    required this.spacingSm,
    required this.spacingMd,
    required this.spacingLg,
    required this.spacingXl,
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
    required this.heightSm,
    required this.heightMd,
    required this.heightLg,
    required this.heightXs,
    required this.textMain,
    required this.textSecondary,
    required this.textOnColor,
    required this.textDisabled,
    required this.borderDefault,
    required this.borderFocus,
    required this.borderDanger,
    required this.backgroundMain,
    required this.backgroundSecond,
    required this.backgroundDisabled,
    required this.backgroundPrimary,
    required this.backgroundPrimarySecond,
    required this.success,
    required this.warning,
    required this.danger,
  });

  // Spacing — Main System 4 / 8 / 16 / 24 / 32
  final double spacingXs;
  final double spacingSm;
  final double spacingMd;
  final double spacingLg;
  final double spacingXl;

  // Radii — Square-Outside / Round-Outside / Full-Outside
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;

  // Component heights — Button XS + shared S / M / L
  final double heightXs;
  final double heightSm;
  final double heightMd;
  final double heightLg;

  // Text & Icons
  final Color textMain;
  final Color textSecondary;
  final Color textOnColor;
  final Color textDisabled;

  // Stroke
  final Color borderDefault;
  final Color borderFocus;
  final Color borderDanger;

  // Background
  final Color backgroundMain;
  final Color backgroundSecond;
  final Color backgroundDisabled;
  final Color backgroundPrimary;
  final Color backgroundPrimarySecond;

  // Semantic accents
  final Color success;
  final Color warning;
  final Color danger;

  @override
  YakThemeExtension copyWith({
    double? spacingXs,
    double? spacingSm,
    double? spacingMd,
    double? spacingLg,
    double? spacingXl,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? heightXs,
    double? heightSm,
    double? heightMd,
    double? heightLg,
    Color? textMain,
    Color? textSecondary,
    Color? textOnColor,
    Color? textDisabled,
    Color? borderDefault,
    Color? borderFocus,
    Color? borderDanger,
    Color? backgroundMain,
    Color? backgroundSecond,
    Color? backgroundDisabled,
    Color? backgroundPrimary,
    Color? backgroundPrimarySecond,
    Color? success,
    Color? warning,
    Color? danger,
  }) {
    return YakThemeExtension(
      spacingXs: spacingXs ?? this.spacingXs,
      spacingSm: spacingSm ?? this.spacingSm,
      spacingMd: spacingMd ?? this.spacingMd,
      spacingLg: spacingLg ?? this.spacingLg,
      spacingXl: spacingXl ?? this.spacingXl,
      radiusSm: radiusSm ?? this.radiusSm,
      radiusMd: radiusMd ?? this.radiusMd,
      radiusLg: radiusLg ?? this.radiusLg,
      heightXs: heightXs ?? this.heightXs,
      heightSm: heightSm ?? this.heightSm,
      heightMd: heightMd ?? this.heightMd,
      heightLg: heightLg ?? this.heightLg,
      textMain: textMain ?? this.textMain,
      textSecondary: textSecondary ?? this.textSecondary,
      textOnColor: textOnColor ?? this.textOnColor,
      textDisabled: textDisabled ?? this.textDisabled,
      borderDefault: borderDefault ?? this.borderDefault,
      borderFocus: borderFocus ?? this.borderFocus,
      borderDanger: borderDanger ?? this.borderDanger,
      backgroundMain: backgroundMain ?? this.backgroundMain,
      backgroundSecond: backgroundSecond ?? this.backgroundSecond,
      backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundPrimarySecond:
          backgroundPrimarySecond ?? this.backgroundPrimarySecond,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
    );
  }

  @override
  YakThemeExtension lerp(ThemeExtension<YakThemeExtension>? other, double t) {
    if (other is! YakThemeExtension) {
      return this;
    }

    return YakThemeExtension(
      spacingXs: spacingXs,
      spacingSm: spacingSm,
      spacingMd: spacingMd,
      spacingLg: spacingLg,
      spacingXl: spacingXl,
      radiusSm: radiusSm,
      radiusMd: radiusMd,
      radiusLg: radiusLg,
      heightXs: heightXs,
      heightSm: heightSm,
      heightMd: heightMd,
      heightLg: heightLg,
      textMain: Color.lerp(textMain, other.textMain, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textOnColor: Color.lerp(textOnColor, other.textOnColor, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderFocus: Color.lerp(borderFocus, other.borderFocus, t)!,
      borderDanger: Color.lerp(borderDanger, other.borderDanger, t)!,
      backgroundMain: Color.lerp(backgroundMain, other.backgroundMain, t)!,
      backgroundSecond: Color.lerp(
        backgroundSecond,
        other.backgroundSecond,
        t,
      )!,
      backgroundDisabled: Color.lerp(
        backgroundDisabled,
        other.backgroundDisabled,
        t,
      )!,
      backgroundPrimary: Color.lerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      backgroundPrimarySecond: Color.lerp(
        backgroundPrimarySecond,
        other.backgroundPrimarySecond,
        t,
      )!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}

/// Yak Society Context — typed access to design tokens from [BuildContext].
extension YakThemeExtensionContext on BuildContext {
  YakThemeExtension get yakTheme =>
      Theme.of(this).extension<YakThemeExtension>()!;

  ColorScheme get yakColorScheme => Theme.of(this).colorScheme;

  TextTheme get yakTextTheme => Theme.of(this).textTheme;
}
