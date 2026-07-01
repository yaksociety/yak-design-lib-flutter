import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import 'yak_destructive_button.dart';
import 'yak_primary_button.dart';
import 'yak_secondary_button.dart';
import 'yak_text_button.dart';

/// Horizontal or vertical action button group (Supernova: Actions).
class YakActions extends StatelessWidget {
  const YakActions({
    super.key,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.onSecondaryPressed,
    this.isDestructive = false,
    this.direction = Axis.horizontal,
    this.spacing,
  });

  final String primaryLabel;
  final VoidCallback? onPrimaryPressed;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryPressed;
  final bool isDestructive;
  final Axis direction;
  final double? spacing;

  bool get _isDualAction =>
      secondaryLabel != null && onSecondaryPressed != null;

  @override
  Widget build(BuildContext context) {
    final gap = spacing ?? context.yakTheme.spacingSm;

    final primary = isDestructive
        ? YakDestructiveButton(
            label: primaryLabel,
            onPressed: onPrimaryPressed,
            isExpanded: direction == Axis.vertical,
          )
        : YakPrimaryButton(
            label: primaryLabel,
            onPressed: onPrimaryPressed,
            isExpanded: direction == Axis.vertical,
          );

    if (!_isDualAction) {
      return primary;
    }

    final secondary = YakSecondaryButton(
      label: secondaryLabel!,
      onPressed: onSecondaryPressed,
      isExpanded: direction == Axis.vertical,
    );

    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          primary,
          SizedBox(height: gap),
          secondary,
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: secondary),
        SizedBox(width: gap),
        Expanded(child: primary),
      ],
    );
  }
}

/// Stacked cancel + confirm pattern with a text cancel action.
class YakActionsWithCancel extends StatelessWidget {
  const YakActionsWithCancel({
    super.key,
    required this.confirmLabel,
    required this.onConfirmPressed,
    this.cancelLabel = 'Cancel',
    this.onCancelPressed,
    this.isDestructive = false,
    this.direction = Axis.vertical,
  });

  final String confirmLabel;
  final VoidCallback? onConfirmPressed;
  final String cancelLabel;
  final VoidCallback? onCancelPressed;
  final bool isDestructive;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final gap = context.yakTheme.spacingSm;
    final confirm = isDestructive
        ? YakDestructiveButton(
            label: confirmLabel,
            onPressed: onConfirmPressed,
            isExpanded: direction == Axis.vertical,
          )
        : YakPrimaryButton(
            label: confirmLabel,
            onPressed: onConfirmPressed,
            isExpanded: direction == Axis.vertical,
          );

    final cancel = YakTextButton(
      label: cancelLabel,
      onPressed: onCancelPressed,
      isExpanded: direction == Axis.vertical,
    );

    if (direction == Axis.horizontal) {
      return Row(
        children: [
          Expanded(child: cancel),
          SizedBox(width: gap),
          Expanded(child: confirm),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        confirm,
        SizedBox(height: gap),
        cancel,
      ],
    );
  }
}
