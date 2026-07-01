import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/text_styles.dart';

/// Shared layout and loading behavior for Yak button widgets.
abstract final class YakButtonHelpers {
  static const double minHeight = 40;

  static bool isDisabled(VoidCallback? onPressed, bool isLoading) =>
      onPressed == null || isLoading;

  static Widget child({
    required BuildContext context,
    required String label,
    required bool isLoading,
    required Color? loadingColor,
  }) {
    if (isLoading) {
      final yakTheme = context.yakTheme;
      return SizedBox(
        width: yakTheme.spacingMd,
        height: yakTheme.spacingMd,
        child: CircularProgressIndicator(strokeWidth: 2, color: loadingColor),
      );
    }
    final foregroundColor = DefaultTextStyle.of(context).style.color;
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
}
