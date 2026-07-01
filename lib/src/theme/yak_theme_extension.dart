import 'package:flutter/material.dart';

/// Custom theme values not covered by [ColorScheme].
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
    required this.textSecondary,
    required this.borderDefault,
    required this.success,
    required this.warning,
    required this.danger,
  });

  final double spacingXs;
  final double spacingSm;
  final double spacingMd;
  final double spacingLg;
  final double spacingXl;
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;
  final Color textSecondary;
  final Color borderDefault;
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
    Color? textSecondary,
    Color? borderDefault,
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
      textSecondary: textSecondary ?? this.textSecondary,
      borderDefault: borderDefault ?? this.borderDefault,
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
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}

extension YakThemeExtensionContext on BuildContext {
  YakThemeExtension get yakTheme =>
      Theme.of(this).extension<YakThemeExtension>()!;
}
