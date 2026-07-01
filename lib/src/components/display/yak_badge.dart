import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

/// Semantic badge color styles (Supernova: Badge).
enum YakBadgeVariant { primary, gray, success, warning, danger }

/// Compact status label (Supernova: Badge).
class YakBadge extends StatelessWidget {
  const YakBadge({
    super.key,
    required this.label,
    this.variant = YakBadgeVariant.primary,
    this.outlined = false,
  });

  final String label;
  final YakBadgeVariant variant;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final color = _resolveColor(yakTheme, Theme.of(context).colorScheme);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(yakTheme.radiusLg),
        border: outlined ? Border.all(color: color) : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: yakTheme.spacingSm,
          vertical: yakTheme.spacingXs,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Color _resolveColor(YakThemeExtension yakTheme, ColorScheme colorScheme) {
    return switch (variant) {
      YakBadgeVariant.primary => colorScheme.primary,
      YakBadgeVariant.gray => yakTheme.textSecondary,
      YakBadgeVariant.success => yakTheme.success,
      YakBadgeVariant.warning => yakTheme.warning,
      YakBadgeVariant.danger => yakTheme.danger,
    };
  }
}
