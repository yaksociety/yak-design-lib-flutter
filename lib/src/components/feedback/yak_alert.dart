import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/text_styles.dart';

/// Semantic alert variants matching Supernova Alert states.
enum YakAlertVariant { info, destructive, gray, success, warning }

/// Visual treatment for [YakAlert].
enum YakAlertStyle { filled, outline, onSurface }

/// Inline alert banner (Supernova: Alert).
class YakAlert extends StatelessWidget {
  const YakAlert({
    super.key,
    required this.message,
    this.title,
    this.variant = YakAlertVariant.info,
    this.style = YakAlertStyle.filled,
    this.icon,
    this.onDismiss,
  });

  final String? title;
  final String message;
  final YakAlertVariant variant;
  final YakAlertStyle style;
  final IconData? icon;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final colors = _resolveColors(context, yakTheme);
    final borderRadius = BorderRadius.circular(yakTheme.radiusMd);
    final resolvedIcon = icon ?? _defaultIcon();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: borderRadius,
        border: colors.border == null
            ? null
            : Border.all(color: colors.border!),
      ),
      child: Padding(
        padding: EdgeInsets.all(yakTheme.spacingMd),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(resolvedIcon, color: colors.foreground, size: 20),
            SizedBox(width: yakTheme.spacingSm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Text(
                      title!,
                      style: AppTextStyles.textMSemibold.copyWith(
                        color: colors.foreground,
                      ),
                    ),
                    SizedBox(height: yakTheme.spacingXs),
                  ],
                  Text(
                    message,
                    style: AppTextStyles.textXSRegular.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            if (onDismiss != null) ...[
              SizedBox(width: yakTheme.spacingSm),
              IconButton(
                onPressed: onDismiss,
                icon: Icon(Icons.close, color: colors.foreground, size: 18),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _defaultIcon() {
    return switch (variant) {
      YakAlertVariant.destructive => Icons.error_outline,
      YakAlertVariant.success => Icons.check_circle_outline,
      YakAlertVariant.warning => Icons.warning_amber_outlined,
      YakAlertVariant.gray => Icons.info_outline,
      YakAlertVariant.info => Icons.info_outline,
    };
  }

  _AlertColors _resolveColors(
    BuildContext context,
    YakThemeExtension yakTheme,
  ) {
    final colors = context.yakColors;
    final (surface, foreground, stroke) = switch (variant) {
      YakAlertVariant.destructive => (
        colors.backgroundDangerSecond,
        colors.textIconsDanger,
        colors.strokeDanger,
      ),
      YakAlertVariant.success => (
        colors.backgroundSuccessSecond,
        colors.textIconsSuccess,
        colors.strokeSuccess,
      ),
      YakAlertVariant.warning => (
        colors.backgroundWarningSecond,
        colors.textIconsWarning,
        colors.strokeWarning,
      ),
      YakAlertVariant.gray => (
        colors.backgroundBaseSecond,
        colors.textIconsBaseSecond,
        colors.strokeBase,
      ),
      YakAlertVariant.info => (
        colors.backgroundPrimarySecond,
        colors.textIconsPrimary,
        colors.strokePrimary,
      ),
    };

    return switch (style) {
      YakAlertStyle.filled => _AlertColors(
        background: surface,
        foreground: foreground,
      ),
      YakAlertStyle.outline => _AlertColors(
        background: Colors.transparent,
        foreground: foreground,
        border: stroke,
      ),
      YakAlertStyle.onSurface => _AlertColors(
        background: colors.backgroundBaseSecond,
        foreground: foreground,
      ),
    };
  }
}

class _AlertColors {
  const _AlertColors({
    required this.background,
    required this.foreground,
    this.border,
  });

  final Color background;
  final Color foreground;
  final Color? border;
}
