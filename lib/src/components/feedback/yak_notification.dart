import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/text_styles.dart';
import '../display/yak_display.dart' show YakIndicator;
import 'yak_alert.dart';

OverlayEntry? _activeYakNotificationEntry;
Timer? _activeYakNotificationTimer;
Future<void> Function()? _activeYakNotificationDismiss;

void _clearActiveYakNotification() {
  _activeYakNotificationTimer?.cancel();
  _activeYakNotificationTimer = null;
  _activeYakNotificationDismiss = null;
  _activeYakNotificationEntry?.remove();
  _activeYakNotificationEntry = null;
}

Future<void> _hideActiveYakNotification() async {
  final dismiss = _activeYakNotificationDismiss;
  if (dismiss != null) {
    await dismiss();
    return;
  }
  _clearActiveYakNotification();
}

/// Toast-style notification (Supernova: Notification).
class YakNotification extends StatelessWidget {
  const YakNotification({
    super.key,
    required this.message,
    this.variant = YakAlertVariant.info,
    this.actionLabel,
    this.onAction,
    this.duration = const Duration(seconds: 4),
  });

  final String message;
  final YakAlertVariant variant;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Duration duration;

  static void hide(BuildContext context) {
    unawaited(_hideActiveYakNotification());
    ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
  }

  static void show(BuildContext context, YakNotification notification) {
    unawaited(_present(context, notification));
  }

  static Future<void> _present(
    BuildContext context,
    YakNotification notification,
  ) async {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    final yakTheme = context.yakTheme;
    final horizontal = yakTheme.spacingMd;
    final topInset = MediaQuery.paddingOf(context).top;

    await _hideActiveYakNotification();

    if (overlay == null) {
      if (!context.mounted) return;
      _showFallbackSnackBar(context, notification);
      return;
    }

    final controller = _YakNotificationToastController();
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (overlayContext) {
        return Positioned(
          top: topInset + yakTheme.spacingSm,
          left: horizontal,
          right: horizontal,
          child: _YakNotificationToast(
            controller: controller,
            notification: notification,
            onDismissed: _clearActiveYakNotification,
          ),
        );
      },
    );

    _activeYakNotificationEntry = entry;
    _activeYakNotificationDismiss = controller.dismiss;
    overlay.insert(entry);

    _activeYakNotificationTimer = Timer(notification.duration, () {
      if (_activeYakNotificationEntry == entry) {
        unawaited(_hideActiveYakNotification());
      }
    });
  }

  static void _showFallbackSnackBar(
    BuildContext context,
    YakNotification notification,
  ) {
    final messenger = ScaffoldMessenger.of(context);
    final yakTheme = context.yakTheme;
    final mediaQuery = MediaQuery.of(context);
    const estimatedHeight = 72.0;

    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(
          left: yakTheme.spacingMd,
          right: yakTheme.spacingMd,
          bottom:
              mediaQuery.size.height -
              mediaQuery.padding.top -
              yakTheme.spacingMd -
              estimatedHeight,
        ),
        duration: notification.duration,
        content: _YakToastBanner(
          message: notification.message,
          variant: notification.variant,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YakAlert(message: message, variant: variant);
  }
}

class _YakNotificationToastController {
  Future<void> Function()? _dismiss;

  Future<void> dismiss() async {
    final dismiss = _dismiss;
    if (dismiss == null) return;
    await dismiss();
  }

  void attach(Future<void> Function() dismiss) {
    _dismiss = dismiss;
  }
}

class _YakNotificationToast extends StatefulWidget {
  const _YakNotificationToast({
    required this.controller,
    required this.notification,
    required this.onDismissed,
  });

  final _YakNotificationToastController controller;
  final YakNotification notification;
  final VoidCallback onDismissed;

  @override
  State<_YakNotificationToast> createState() => _YakNotificationToastState();
}

class _YakNotificationToastState extends State<_YakNotificationToast>
    with SingleTickerProviderStateMixin {
  static const _showDuration = Duration(milliseconds: 280);
  static const _hideDuration = Duration(milliseconds: 220);

  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _showDuration,
      reverseDuration: _hideDuration,
    );
    _slide = Tween<Offset>(begin: const Offset(0, -0.35), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );
    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    widget.controller.attach(_dismiss);
    unawaited(_controller.forward());
  }

  Future<void> _dismiss() async {
    if (!mounted) return;
    await _controller.reverse();
    if (!mounted) return;
    widget.onDismissed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _fade,
        child: Material(
          color: Colors.transparent,
          child: _YakToastBanner(
            message: widget.notification.message,
            variant: widget.notification.variant,
            actionLabel: widget.notification.actionLabel,
            onAction: widget.notification.onAction == null
                ? null
                : () {
                    unawaited(_dismiss());
                    widget.notification.onAction?.call();
                  },
          ),
        ),
      ),
    );
  }
}

class _YakToastBanner extends StatelessWidget {
  const _YakToastBanner({
    required this.message,
    required this.variant,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final YakAlertVariant variant;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final accent = _accentFor(context, yakTheme, variant);
    final icon = _iconFor(variant);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
        border: Border.all(
          color: yakTheme.borderDefault.withValues(alpha: 0.45),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: yakTheme.spacingMd,
          vertical: yakTheme.spacingSm,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(icon, size: 18, color: accent),
              ),
            ),
            SizedBox(width: yakTheme.spacingSm),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.textSRegular.copyWith(
                  color: colorScheme.onSurface,
                  height: 1.4,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (actionLabel != null) ...[
              SizedBox(width: yakTheme.spacingXs),
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  foregroundColor: accent,
                  padding: EdgeInsets.symmetric(horizontal: yakTheme.spacingSm),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(actionLabel!, style: AppTextStyles.textXSSemibold),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static Color _accentFor(
    BuildContext context,
    YakThemeExtension yakTheme,
    YakAlertVariant variant,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return switch (variant) {
      YakAlertVariant.destructive => yakTheme.danger,
      YakAlertVariant.success => yakTheme.success,
      YakAlertVariant.warning => yakTheme.warning,
      YakAlertVariant.gray => yakTheme.textSecondary,
      YakAlertVariant.info => colorScheme.primary,
    };
  }

  static IconData _iconFor(YakAlertVariant variant) {
    return switch (variant) {
      YakAlertVariant.destructive => Icons.error_outline,
      YakAlertVariant.success => Icons.check_circle_outline,
      YakAlertVariant.warning => Icons.warning_amber_outlined,
      YakAlertVariant.gray => Icons.info_outline,
      YakAlertVariant.info => Icons.info_outline,
    };
  }
}

/// Notification list card (Supernova: Notification-Card).
class YakNotificationCard extends StatelessWidget {
  const YakNotificationCard({
    super.key,
    required this.title,
    required this.message,
    this.timestamp,
    this.unread = false,
    this.onTap,
  });

  final String title;
  final String message;
  final String? timestamp;
  final bool unread;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return ListTile(
      onTap: onTap,
      leading: unread
          ? YakIndicator(color: Theme.of(context).colorScheme.primary)
          : null,
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
      subtitle: Text(message),
      trailing: timestamp == null
          ? null
          : Text(
              timestamp!,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: yakTheme.textSecondary),
            ),
    );
  }
}
