import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import 'yak_button_helpers.dart';

/// Filled secondary action button (same layout as [YakPrimaryButton]).
class YakSecondaryButton extends StatelessWidget {
  const YakSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
    this.size = YakButtonSize.md,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final YakButtonSize size;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final isDisabled = YakButtonHelpers.isDisabled(onPressed, isLoading);
    final (_, foreground) = YakButtonHelpers.secondaryColors(context);

    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: YakButtonHelpers.secondaryFilledStyle(
        context: context,
        yakTheme: yakTheme,
        size: size,
        isExpanded: isExpanded,
      ),
      child: YakButtonHelpers.child(
        context: context,
        label: label,
        isLoading: isLoading,
        loadingColor: foreground,
        labelColor: isDisabled ? yakTheme.textSecondary : null,
      ),
    );
  }
}
