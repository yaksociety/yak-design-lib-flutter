import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../display/yak_display.dart' show YakIndicator;
import 'yak_alert.dart';

/// Toast-style notification (Supernova: Notification).
class YakNotification extends StatelessWidget {
  const YakNotification({
    super.key,
    required this.message,
    this.variant = YakAlertVariant.info,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final YakAlertVariant variant;
  final String? actionLabel;
  final VoidCallback? onAction;

  static void show(BuildContext context, YakNotification notification) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(notification.message),
        action: notification.actionLabel == null
            ? null
            : SnackBarAction(
                label: notification.actionLabel!,
                onPressed: notification.onAction ?? () {},
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YakAlert(message: message, variant: variant);
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
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: yakTheme.textSecondary,
              ),
            ),
    );
  }
}
