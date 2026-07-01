import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import 'yak_button_helpers.dart';

/// Destructive action button for irreversible or dangerous operations.
class YakDestructiveButton extends StatelessWidget {
  const YakDestructiveButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final isDisabled = YakButtonHelpers.isDisabled(onPressed, isLoading);

    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: yakTheme.danger,
        foregroundColor: Theme.of(context).colorScheme.onError,
        disabledBackgroundColor: Theme.of(context).disabledColor,
        minimumSize: Size(isExpanded ? double.infinity : 0, YakButtonHelpers.minHeight),
        shape: YakButtonHelpers.shape(yakTheme),
      ),
      child: YakButtonHelpers.child(
        context: context,
        label: label,
        isLoading: isLoading,
        loadingColor: Theme.of(context).colorScheme.onError,
      ),
    );
  }
}
