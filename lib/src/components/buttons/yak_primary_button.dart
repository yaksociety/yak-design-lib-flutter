import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import 'yak_button_helpers.dart';

/// Primary action button for the Yak design system.
class YakPrimaryButton extends StatelessWidget {
  const YakPrimaryButton({
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
    final scheme = context.yakColorScheme;
    final isDisabled = YakButtonHelpers.isDisabled(onPressed, isLoading);

    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        disabledBackgroundColor: yakTheme.backgroundDisabled,
        disabledForegroundColor: yakTheme.textSecondary,
        minimumSize: YakButtonHelpers.minimumSize(
          size: size,
          isExpanded: isExpanded,
          yakTheme: yakTheme,
        ),
        padding: YakButtonHelpers.paddingFor(size),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: YakButtonHelpers.shape(yakTheme),
      ),
      child: YakButtonHelpers.child(
        context: context,
        label: label,
        isLoading: isLoading,
        loadingColor: scheme.onPrimary,
        labelColor: isDisabled ? yakTheme.textSecondary : null,
      ),
    );
  }
}
