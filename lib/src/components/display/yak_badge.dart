import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/semantic_colors.dart';

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
    final (surface, color, stroke) = _resolveColors(context.yakColors);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : surface,
        borderRadius: BorderRadius.circular(yakTheme.radiusLg),
        border: outlined ? Border.all(color: stroke) : null,
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

  (Color surface, Color foreground, Color stroke) _resolveColors(
    YakSemanticColors colors,
  ) {
    return switch (variant) {
      YakBadgeVariant.primary => (
        colors.backgroundPrimarySecond,
        colors.textIconsPrimary,
        colors.strokePrimary,
      ),
      YakBadgeVariant.gray => (
        colors.backgroundBaseSecond,
        colors.textIconsBaseSecond,
        colors.strokeBase,
      ),
      YakBadgeVariant.success => (
        colors.backgroundSuccessSecond,
        colors.textIconsSuccess,
        colors.strokeSuccess,
      ),
      YakBadgeVariant.warning => (
        colors.backgroundWarningSecond,
        colors.textIconsWarning,
        colors.strokeWarning,
      ),
      YakBadgeVariant.danger => (
        colors.backgroundDangerSecond,
        colors.textIconsDanger,
        colors.strokeDanger,
      ),
    };
  }
}
