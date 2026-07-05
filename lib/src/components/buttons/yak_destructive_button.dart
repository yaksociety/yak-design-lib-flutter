import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/colors.dart';
import 'yak_button_helpers.dart';

/// Destructive action button for irreversible or dangerous operations.
class YakDestructiveButton extends StatelessWidget {
  const YakDestructiveButton({
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

    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: yakTheme.danger,
        foregroundColor: AppColors.textIconsOnColor,
        disabledBackgroundColor: AppColors.backgroundDisabled,
        disabledForegroundColor: yakTheme.textSecondary,
        minimumSize: YakButtonHelpers.minimumSize(
          size: size,
          isExpanded: isExpanded,
        ),
        padding: YakButtonHelpers.paddingFor(size),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: YakButtonHelpers.shape(yakTheme),
      ),
      child: YakButtonHelpers.child(
        context: context,
        label: label,
        isLoading: isLoading,
        loadingColor: AppColors.textIconsOnColor,
        labelColor: isDisabled
            ? yakTheme.textSecondary
            : AppColors.textIconsOnColor,
      ),
    );
  }
}
