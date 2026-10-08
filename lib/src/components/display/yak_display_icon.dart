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
    final colors = context.yakColors;

    return switch (style) {
      YakDisplayIconStyle.primary => _IconColors(
        background: colors.backgroundPrimaryMain,
        foreground: colors.textIconsOnLight,
      ),
      YakDisplayIconStyle.secondary => _IconColors(
        background: colors.backgroundPrimarySecond,
        foreground: colors.textIconsBaseMain,
      ),
      YakDisplayIconStyle.outline => _IconColors(
        background: Colors.transparent,
        foreground: colors.textIconsBaseMain,
        border: colors.strokeBase,
      ),
      YakDisplayIconStyle.ghost => _IconColors(
        background: Colors.transparent,
        foreground: colors.textIconsBaseMain,
      ),
      YakDisplayIconStyle.danger => _IconColors(
        background: colors.backgroundDangerMain,
        foreground: colors.textIconsOnDark,
      ),
      YakDisplayIconStyle.gray => _IconColors(
        background: colors.backgroundBaseThird,
        foreground: colors.textIconsBaseSecond,
      ),
      YakDisplayIconStyle.success => _IconColors(
        background: colors.backgroundSuccessMain,
        foreground: colors.textIconsOnDark,
      ),
      YakDisplayIconStyle.warning => _IconColors(
        background: colors.backgroundWarningMain,
        foreground: colors.textIconsOnDark,
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
