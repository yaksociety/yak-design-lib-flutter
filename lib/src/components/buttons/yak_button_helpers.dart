import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/colors.dart';
import '../../tokens/generated/dimensions.dart';
import '../../tokens/generated/text_styles.dart';

/// Supernova button sizes (XS / S / M / L).
enum YakButtonSize {
  /// 36px — button only.
  xs,

  /// 40px (S).
  sm,

  /// 44px (M, default).
  md,

  /// 48px (L).
  lg,
}

/// Shared layout and loading behavior for Yak button widgets.
abstract final class YakButtonHelpers {
  static double heightFor(YakButtonSize size) {
    return switch (size) {
      YakButtonSize.xs => AppDimensions.mainSystemNum36,
      YakButtonSize.sm => AppDimensions.mainSystemNum40,
      YakButtonSize.md => AppDimensions.mainSystemNum44,
      YakButtonSize.lg => AppDimensions.mainSystemNum48,
    };
  }

  static EdgeInsets paddingFor(YakButtonSize size) {
    return switch (size) {
      YakButtonSize.xs => const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum12,
      ),
      YakButtonSize.sm => const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum24,
      ),
      YakButtonSize.md => const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum32,
      ),
      YakButtonSize.lg => const EdgeInsets.symmetric(
        horizontal: AppDimensions.mainSystemNum32,
      ),
    };
  }

  static bool isDisabled(VoidCallback? onPressed, bool isLoading) =>
      onPressed == null || isLoading;

  static Size minimumSize({
    required YakButtonSize size,
    required bool isExpanded,
  }) {
    return Size(isExpanded ? double.infinity : 0, heightFor(size));
  }

  static ButtonStyle baseStyle({
    required YakThemeExtension yakTheme,
    required YakButtonSize size,
    required bool isExpanded,
  }) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        minimumSize(size: size, isExpanded: isExpanded),
      ),
      padding: WidgetStatePropertyAll(paddingFor(size)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: WidgetStatePropertyAll(shape(yakTheme)),
    );
  }

  static Widget child({
    required BuildContext context,
    required String label,
    required bool isLoading,
    required Color? loadingColor,
    Color? labelColor,
  }) {
    if (isLoading) {
      final yakTheme = context.yakTheme;
      return SizedBox(
        width: yakTheme.spacingMd,
        height: yakTheme.spacingMd,
        child: CircularProgressIndicator(strokeWidth: 2, color: loadingColor),
      );
    }
    final foregroundColor =
        labelColor ?? DefaultTextStyle.of(context).style.color;
    return Text(
      label,
      style: AppTextStyles.textMSemibold.copyWith(color: foregroundColor),
    );
  }

  static OutlinedBorder shape(YakThemeExtension yakTheme) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(yakTheme.radiusMd),
    );
  }

  static (Color background, Color foreground) secondaryColors(
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? (AppColors.backgroundBaseDarkSecond, AppColors.textIconsOnColor)
        : (AppColors.backgroundBaseSecond, AppColors.textIconsBaseMain);
  }

  static ButtonStyle secondaryFilledStyle({
    required BuildContext context,
    required YakThemeExtension yakTheme,
    required YakButtonSize size,
    required bool isExpanded,
  }) {
    final (background, foreground) = secondaryColors(context);

    return FilledButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      disabledBackgroundColor: AppColors.backgroundDisabled,
      disabledForegroundColor: AppColors.textIconsDisabled,
      minimumSize: minimumSize(size: size, isExpanded: isExpanded),
      padding: paddingFor(size),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: shape(yakTheme),
    );
  }
}
