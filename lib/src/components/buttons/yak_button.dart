import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../display/yak_display_icon.dart';

/// Supernova Button styles (Display Icon / Button variants).
enum YakButtonStyle {
  primary,
  secondary,
  outline,
  ghost,
  danger,
  gray,
  link,
  success,
  warning,
  tertiary,
}

/// Unified text button matching Supernova [Button] component.
class YakButton extends StatelessWidget {
  const YakButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = YakButtonStyle.primary,
    this.isLoading = false,
    this.isExpanded = false,
    this.leading,
    this.trailing,
  });

  final String label;
  final VoidCallback? onPressed;
  final YakButtonStyle style;
  final bool isLoading;
  final bool isExpanded;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final disabled = onPressed == null || isLoading;
    final child = _buildChild(context);

    final button = switch (style) {
      YakButtonStyle.primary ||
      YakButtonStyle.danger ||
      YakButtonStyle.success ||
      YakButtonStyle.warning => FilledButton(
        onPressed: disabled ? null : onPressed,
        style: _filledStyle(context, yakTheme),
        child: child,
      ),
      YakButtonStyle.secondary ||
      YakButtonStyle.outline ||
      YakButtonStyle.gray => OutlinedButton(
        onPressed: disabled ? null : onPressed,
        style: _outlinedStyle(context, yakTheme),
        child: child,
      ),
      YakButtonStyle.ghost ||
      YakButtonStyle.link ||
      YakButtonStyle.tertiary => TextButton(
        onPressed: disabled ? null : onPressed,
        style: _textStyle(context, yakTheme),
        child: child,
      ),
    };

    if (!isExpanded) return button;
    return SizedBox(width: double.infinity, child: button);
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: _loadingColor(context),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 8)],
        Text(label),
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ],
    );
  }

  Color _loadingColor(BuildContext context) {
    return switch (style) {
      YakButtonStyle.primary ||
      YakButtonStyle.danger ||
      YakButtonStyle.success ||
      YakButtonStyle.warning => Theme.of(context).colorScheme.onPrimary,
      _ => Theme.of(context).colorScheme.primary,
    };
  }

  ButtonStyle _filledStyle(BuildContext context, YakThemeExtension yakTheme) {
    final scheme = Theme.of(context).colorScheme;
    final (bg, fg) = switch (style) {
      YakButtonStyle.danger => (yakTheme.danger, scheme.onError),
      YakButtonStyle.success => (yakTheme.success, Colors.white),
      YakButtonStyle.warning => (yakTheme.warning, Colors.white),
      _ => (scheme.primary, scheme.onPrimary),
    };

    return FilledButton.styleFrom(
      backgroundColor: bg,
      foregroundColor: fg,
      minimumSize: const Size(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
      ),
    );
  }

  ButtonStyle _outlinedStyle(BuildContext context, YakThemeExtension yakTheme) {
    return OutlinedButton.styleFrom(
      minimumSize: const Size(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
      ),
      side: BorderSide(color: yakTheme.borderDefault),
    );
  }

  ButtonStyle _textStyle(BuildContext context, YakThemeExtension yakTheme) {
    return TextButton.styleFrom(
      minimumSize: const Size(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
      ),
    );
  }
}

/// Icon-only button (Supernova: Icon Button). Alias for [YakDisplayIcon].
typedef YakIconButton = YakDisplayIcon;

/// Close / dismiss icon button (Supernova: Button Close).
class YakCloseButton extends StatelessWidget {
  const YakCloseButton({super.key, this.onPressed, this.size = 40});

  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return YakDisplayIcon(
      icon: Icons.close,
      onPressed: onPressed,
      style: YakDisplayIconStyle.ghost,
      size: size,
    );
  }
}

/// Favorite toggle button (Supernova: Button Love).
class YakLoveButton extends StatefulWidget {
  const YakLoveButton({
    super.key,
    this.isLoved = false,
    this.onChanged,
    this.size = 40,
  });

  final bool isLoved;
  final ValueChanged<bool>? onChanged;
  final double size;

  @override
  State<YakLoveButton> createState() => _YakLoveButtonState();
}

class _YakLoveButtonState extends State<YakLoveButton> {
  late var _isLoved = widget.isLoved;

  @override
  Widget build(BuildContext context) {
    return YakDisplayIcon(
      icon: _isLoved ? Icons.favorite : Icons.favorite_border,
      onPressed: widget.onChanged == null
          ? null
          : () {
              setState(() => _isLoved = !_isLoved);
              widget.onChanged!(_isLoved);
            },
      style: _isLoved
          ? YakDisplayIconStyle.danger
          : YakDisplayIconStyle.ghost,
      size: widget.size,
    );
  }
}

/// Horizontal button row (Supernova: Button group).
class YakButtonGroup extends StatelessWidget {
  const YakButtonGroup({
    super.key,
    required this.children,
    this.spacing,
    this.direction = Axis.horizontal,
  });

  final List<Widget> children;
  final double? spacing;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final gap = spacing ?? context.yakTheme.spacingSm;
    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) SizedBox(height: gap),
            children[i],
          ],
        ],
      );
    }

    return Wrap(spacing: gap, runSpacing: gap, children: children);
  }
}

/// Social share button row (Supernova: Social button groups).
class YakSocialButtonGroup extends StatelessWidget {
  const YakSocialButtonGroup({
    super.key,
    this.onFacebook,
    this.onLine,
    this.onShare,
  });

  final VoidCallback? onFacebook;
  final VoidCallback? onLine;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return YakButtonGroup(
      children: [
        YakDisplayIcon(
          icon: Icons.facebook,
          onPressed: onFacebook,
          style: YakDisplayIconStyle.primary,
        ),
        YakDisplayIcon(
          icon: Icons.chat_bubble_outline,
          onPressed: onLine,
          style: YakDisplayIconStyle.success,
        ),
        YakDisplayIcon(
          icon: Icons.share_outlined,
          onPressed: onShare,
          style: YakDisplayIconStyle.outline,
        ),
      ],
    );
  }
}
