import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

/// Icon button visual styles (Supernova: Display Icon).
enum YakDisplayIconStyle {
  primary,
  secondary,
  outline,
  ghost,
  danger,
  gray,
  success,
  warning,
}

/// Icon-only action control (Supernova: Display Icon).
class YakDisplayIcon extends StatelessWidget {
  const YakDisplayIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.style = YakDisplayIconStyle.primary,
    this.size = 40,
    this.shape = BoxShape.circle,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final YakDisplayIconStyle style;
  final double size;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final colors = _resolveColors(context, yakTheme);
    final borderRadius = shape == BoxShape.circle
        ? BorderRadius.circular(size / 2)
        : BorderRadius.circular(yakTheme.radiusSm);

    return Material(
      color: colors.background,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: colors.border == null
            ? BorderSide.none
            : BorderSide(color: colors.border!),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: colors.foreground, size: size * 0.45),
        ),
      ),
    );
  }

  _IconColors _resolveColors(BuildContext context, YakThemeExtension yakTheme) {
    final colorScheme = Theme.of(context).colorScheme;

    return switch (style) {
      YakDisplayIconStyle.primary => _IconColors(
        background: colorScheme.primary,
        foreground: colorScheme.onPrimary,
      ),
      YakDisplayIconStyle.secondary => _IconColors(
        background: colorScheme.surfaceContainerHighest,
        foreground: colorScheme.onSurface,
      ),
      YakDisplayIconStyle.outline => _IconColors(
        background: Colors.transparent,
        foreground: colorScheme.onSurface,
        border: yakTheme.borderDefault,
      ),
      YakDisplayIconStyle.ghost => _IconColors(
        background: Colors.transparent,
        foreground: colorScheme.onSurface,
      ),
      YakDisplayIconStyle.danger => _IconColors(
        background: yakTheme.danger,
        foreground: colorScheme.onError,
      ),
      YakDisplayIconStyle.gray => _IconColors(
        background: yakTheme.borderDefault.withValues(alpha: 0.2),
        foreground: yakTheme.textSecondary,
      ),
      YakDisplayIconStyle.success => _IconColors(
        background: yakTheme.success,
        foreground: Colors.white,
      ),
      YakDisplayIconStyle.warning => _IconColors(
        background: yakTheme.warning,
        foreground: Colors.white,
      ),
    };
  }
}

class _IconColors {
  const _IconColors({
    required this.background,
    required this.foreground,
    this.border,
  });

  final Color background;
  final Color foreground;
  final Color? border;
}
