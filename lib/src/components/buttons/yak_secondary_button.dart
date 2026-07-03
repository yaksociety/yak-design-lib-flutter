import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import 'yak_button_helpers.dart';

/// Outlined secondary action button.
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
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
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
        loadingColor: colorScheme.primary,
      ),
    );
  }
}
