import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

/// Expandable content section (Supernova: Accordion).
class YakAccordion extends StatelessWidget {
  const YakAccordion({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(yakTheme.radiusSm),
        side: BorderSide(color: yakTheme.borderDefault),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: EdgeInsets.symmetric(
            horizontal: yakTheme.spacingMd,
            vertical: yakTheme.spacingXs,
          ),
          childrenPadding: EdgeInsets.fromLTRB(
            yakTheme.spacingMd,
            0,
            yakTheme.spacingMd,
            yakTheme.spacingMd,
          ),
          title: Text(title, style: Theme.of(context).textTheme.titleSmall),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: yakTheme.textSecondary,
                  ),
                ),
          children: [child],
        ),
      ),
    );
  }
}
