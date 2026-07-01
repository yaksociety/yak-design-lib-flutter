import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

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
    // need text black color use from ya
    return Text(label, style: TextStyle(color: context.yakTheme.textSecondary));
  }

  static OutlinedBorder shape(YakThemeExtension yakTheme) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(yakTheme.radiusMd),
    );
  }
}
