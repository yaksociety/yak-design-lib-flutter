import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

/// Avatar size tokens aligned with Supernova Avatar sizes.
enum YakAvatarSize {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

/// Avatar content style (Supernova: Icon / Photo / Text).
enum YakAvatarStyle {
  icon,
  photo,
  text,
}

/// Avatar shape (Supernova: Circle / Square).
enum YakAvatarShape {
  circle,
  square,
}

/// User or entity avatar (Supernova: Avatar).
class YakAvatar extends StatelessWidget {
  const YakAvatar({
    super.key,
    this.size = YakAvatarSize.md,
    this.style = YakAvatarStyle.text,
    this.shape = YakAvatarShape.circle,
    this.initials,
    this.image,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  final YakAvatarSize size;
  final YakAvatarStyle style;
  final YakAvatarShape shape;
  final String? initials;
  final ImageProvider? image;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final dimension = sizeFor(size);
    final radius = shape == YakAvatarShape.circle
        ? BorderRadius.circular(dimension / 2)
        : BorderRadius.circular(yakTheme.radiusSm);
    final bg = backgroundColor ?? yakTheme.borderDefault.withValues(alpha: 0.2);
    final fg = foregroundColor ?? Theme.of(context).colorScheme.onSurface;

    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: style == YakAvatarStyle.photo ? null : bg,
        borderRadius: radius,
        image: style == YakAvatarStyle.photo && image != null
            ? DecorationImage(image: image!, fit: BoxFit.cover)
            : null,
      ),
      alignment: Alignment.center,
      child: switch (style) {
        YakAvatarStyle.photo => image == null ? _fallbackIcon(fg, dimension) : null,
        YakAvatarStyle.icon => Icon(
          icon ?? Icons.person,
          color: fg,
          size: dimension * 0.45,
        ),
        YakAvatarStyle.text => Text(
          _resolvedInitials(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: fg,
            fontSize: dimension * 0.35,
            fontWeight: FontWeight.w600,
          ),
        ),
      },
    );
  }

  Widget _fallbackIcon(Color color, double dimension) {
    return Icon(Icons.person, color: color, size: dimension * 0.45);
  }

  String _resolvedInitials() {
    final value = initials?.trim();
    if (value == null || value.isEmpty) return '?';
    return value.length <= 2 ? value.toUpperCase() : value.substring(0, 2).toUpperCase();
  }

  static double sizeFor(YakAvatarSize size) {
    return switch (size) {
      YakAvatarSize.xs => 24,
      YakAvatarSize.sm => 32,
      YakAvatarSize.md => 40,
      YakAvatarSize.lg => 48,
      YakAvatarSize.xl => 56,
      YakAvatarSize.xxl => 64,
    };
  }
}
