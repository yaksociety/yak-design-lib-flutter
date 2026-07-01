import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../buttons/yak_actions.dart';
import '../inputs/yak_inputs.dart';

/// Modal dialog content (Supernova: Modal).
class YakModal extends StatelessWidget {
  const YakModal({
    super.key,
    required this.title,
    this.message,
    this.child,
    this.primaryLabel,
    this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.isDestructive = false,
    this.showClose = true,
  });

  final String title;
  final String? message;
  final Widget? child;
  final String? primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final bool isDestructive;
  final bool showClose;

  static Future<T?> show<T>({
    required BuildContext context,
    required YakModal modal,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => Dialog(child: modal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Padding(
      padding: EdgeInsets.all(yakTheme.spacingMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(title, style: Theme.of(context).textTheme.titleMedium),
              ),
              if (showClose)
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
            ],
          ),
          if (message != null) ...[
            SizedBox(height: yakTheme.spacingSm),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ],
          if (child != null) ...[
            SizedBox(height: yakTheme.spacingMd),
            child!,
          ],
          if (primaryLabel != null) ...[
            SizedBox(height: yakTheme.spacingLg),
            YakActions(
              primaryLabel: primaryLabel!,
              onPrimaryPressed: onPrimary,
              secondaryLabel: secondaryLabel,
              onSecondaryPressed: onSecondary,
              isDestructive: isDestructive,
              direction: secondaryLabel == null ? Axis.vertical : Axis.horizontal,
            ),
          ],
        ],
      ),
    );
  }
}

/// Bottom sheet wrapper (Supernova: BottomSheet).
class YakBottomSheet extends StatelessWidget {
  const YakBottomSheet({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final Widget child;

  static Future<T?> show<T>({
    required BuildContext context,
    required YakBottomSheet sheet,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: sheet,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        yakTheme.spacingMd,
        yakTheme.spacingSm,
        yakTheme.spacingMd,
        yakTheme.spacingLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (subtitle != null) ...[
            SizedBox(height: yakTheme.spacingXs),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: yakTheme.textSecondary,
              ),
            ),
          ],
          SizedBox(height: yakTheme.spacingMd),
          child,
        ],
      ),
    );
  }
}

/// Sticky footer action area (Supernova: FooterSheet).
class YakFooterSheet extends StatelessWidget {
  const YakFooterSheet({
    super.key,
    required this.child,
    this.checkboxLabel,
    this.checkboxValue,
    this.onCheckboxChanged,
    this.primaryLabel,
    this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.isDestructive = false,
    this.sticky = true,
  });

  final Widget child;
  final String? checkboxLabel;
  final bool? checkboxValue;
  final ValueChanged<bool>? onCheckboxChanged;
  final String? primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final bool isDestructive;
  final bool sticky;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final footer = Container(
      padding: EdgeInsets.all(yakTheme.spacingMd),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(top: BorderSide(color: yakTheme.borderDefault)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (checkboxLabel != null && checkboxValue != null) ...[
            YakCheckbox(
              label: checkboxLabel!,
              value: checkboxValue!,
              onChanged: onCheckboxChanged,
            ),
            SizedBox(height: yakTheme.spacingMd),
          ],
          if (primaryLabel != null)
            YakActions(
              primaryLabel: primaryLabel!,
              onPrimaryPressed: onPrimary,
              secondaryLabel: secondaryLabel,
              onSecondaryPressed: onSecondary,
              isDestructive: isDestructive,
              direction: Axis.vertical,
            ),
        ],
      ),
    );

    if (!sticky) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [child, footer],
      );
    }

    return Column(
      children: [
        Expanded(child: child),
        footer,
      ],
    );
  }
}

/// Tooltip wrapper (Supernova: Tool tip).
class YakTooltip extends StatelessWidget {
  const YakTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: message, child: child);
  }
}
