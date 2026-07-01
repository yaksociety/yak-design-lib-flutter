import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../feedback/yak_alert.dart';
import '../surfaces/yak_accordion.dart';
import 'yak_avatar.dart';

/// Avatar with title and subtitle (Supernova: Avatar & description).
class YakAvatarDescription extends StatelessWidget {
  const YakAvatarDescription({
    super.key,
    required this.title,
    this.subtitle,
    this.initials,
    this.image,
    this.size = YakAvatarSize.md,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final String? initials;
  final ImageProvider? image;
  final YakAvatarSize size;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Row(
      children: [
        YakAvatar(
          initials: initials ?? title,
          image: image,
          size: size,
          style: image != null ? YakAvatarStyle.photo : YakAvatarStyle.text,
        ),
        SizedBox(width: yakTheme.spacingMd),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleSmall),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: yakTheme.textSecondary,
                  ),
                ),
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }
}

/// Overlapping avatar stack (Supernova: Avatar group).
class YakAvatarGroup extends StatelessWidget {
  const YakAvatarGroup({
    super.key,
    required this.initials,
    this.size = YakAvatarSize.sm,
    this.maxVisible = 4,
  });

  final List<String> initials;
  final YakAvatarSize size;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    final visible = initials.take(maxVisible).toList();
    final dimension = YakAvatar.sizeFor(size);
    final overlap = dimension * 0.35;

    return SizedBox(
      width: dimension + (visible.length - 1) * (dimension - overlap),
      height: dimension,
      child: Stack(
        children: [
          for (var i = 0; i < visible.length; i++)
            Positioned(
              left: i * (dimension - overlap),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: YakAvatar(initials: visible[i], size: size),
              ),
            ),
        ],
      ),
    );
  }
}

/// Promotional banner (Supernova: Banner).
class YakBanner extends StatelessWidget {
  const YakBanner({
    super.key,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.variant = YakAlertVariant.info,
  });

  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final YakAlertVariant variant;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final accent = _accent(context, yakTheme);

    return Container(
      padding: EdgeInsets.all(yakTheme.spacingMd),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                if (message != null) ...[
                  SizedBox(height: yakTheme.spacingXs),
                  Text(message!, style: Theme.of(context).textTheme.bodySmall),
                ],
              ],
            ),
          ),
          if (actionLabel != null)
            TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }

  Color _accent(BuildContext context, YakThemeExtension yakTheme) {
    return switch (variant) {
      YakAlertVariant.destructive => yakTheme.danger,
      YakAlertVariant.success => yakTheme.success,
      YakAlertVariant.warning => yakTheme.warning,
      YakAlertVariant.gray => yakTheme.textSecondary,
      YakAlertVariant.info => Theme.of(context).colorScheme.primary,
    };
  }
}

/// Section title row (Supernova: Section-Header).
class YakSectionHeader extends StatelessWidget {
  const YakSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        if (actionLabel != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}

/// List action row (Supernova: Action-item).
class YakActionItem extends StatelessWidget {
  const YakActionItem({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon == null ? null : Icon(icon),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

/// Selectable list tile (Supernova: Tile).
class YakTile extends StatelessWidget {
  const YakTile({
    super.key,
    required this.title,
    this.subtitle,
    this.selected = false,
    this.onTap,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      selected: selected,
      selectedTileColor: yakTheme.borderDefault.withValues(alpha: 0.15),
      onTap: onTap,
      trailing: selected ? const Icon(Icons.check_circle) : null,
    );
  }
}

/// Choice chip (Supernova: chip).
class YakChip extends StatelessWidget {
  const YakChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onTap == null ? null : (_) => onTap!(),
    );
  }
}

/// Filter chip (Supernova: filter-chip).
typedef YakFilterChip = YakChip;

/// Rating filter chip (Supernova: Rating-Chip).
class YakRatingChip extends StatelessWidget {
  const YakRatingChip({
    super.key,
    required this.rating,
    this.selected = false,
    this.onTap,
  });

  final double rating;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 16),
          const SizedBox(width: 4),
          Text(rating.toStringAsFixed(1)),
        ],
      ),
      selected: selected,
      onSelected: onTap == null ? null : (_) => onTap!(),
    );
  }
}

/// Segmented control (Supernova: Mobile Segmented Control).
class YakSegmentedControl extends StatelessWidget {
  const YakSegmentedControl({
    super.key,
    required this.segments,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> segments;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<int>(
      segments: [
        for (var i = 0; i < segments.length; i++)
          ButtonSegment(value: i, label: Text(segments[i])),
      ],
      selected: {selectedIndex},
      onSelectionChanged: (s) => onChanged(s.first),
    );
  }
}

/// Multi-option selector (Supernova: Selector-Group).
class YakSelectorGroup extends StatelessWidget {
  const YakSelectorGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.allowMultiple = false,
  });

  final List<String> options;
  final Set<String> selected;
  final void Function(String option, bool isSelected) onChanged;
  final bool allowMultiple;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Wrap(
      spacing: yakTheme.spacingSm,
      runSpacing: yakTheme.spacingSm,
      children: [
        for (final option in options)
          YakChip(
            label: option,
            selected: selected.contains(option),
            onTap: () {
              final isSelected = selected.contains(option);
              onChanged(option, allowMultiple ? !isSelected : true);
            },
          ),
      ],
    );
  }
}

/// Page headline (Supernova: Headline).
class YakHeadline extends StatelessWidget {
  const YakHeadline({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}

/// Section title (Supernova: Title).
class YakTitle extends StatelessWidget {
  const YakTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }
}

/// Expandable detail block (Supernova: Detail-expand).
class YakDetailExpand extends StatelessWidget {
  const YakDetailExpand({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return YakAccordion(
      title: title,
      initiallyExpanded: initiallyExpanded,
      child: child,
    );
  }
}

/// Status dot indicator (Supernova: Indicator).
class YakIndicator extends StatelessWidget {
  const YakIndicator({super.key, this.color, this.size = 8});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final dotColor = color ?? context.yakTheme.success;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
    );
  }
}

/// User comment block (Supernova: Comment).
class YakComment extends StatelessWidget {
  const YakComment({
    super.key,
    required this.author,
    required this.message,
    this.timestamp,
  });

  final String author;
  final String message;
  final String? timestamp;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(author, style: Theme.of(context).textTheme.labelLarge),
            if (timestamp != null) ...[
              SizedBox(width: yakTheme.spacingSm),
              Text(
                timestamp!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: yakTheme.textSecondary),
              ),
            ],
          ],
        ),
        SizedBox(height: yakTheme.spacingXs),
        Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

/// Chat bubble (Supernova: Chat).
class YakChatBubble extends StatelessWidget {
  const YakChatBubble({
    super.key,
    required this.message,
    this.isMine = false,
    this.timestamp,
  });

  final String message;
  final bool isMine;
  final String? timestamp;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final scheme = Theme.of(context).colorScheme;

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: yakTheme.spacingXs),
        padding: EdgeInsets.all(yakTheme.spacingMd),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isMine
              ? scheme.primary.withValues(alpha: 0.15)
              : yakTheme.borderDefault.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(yakTheme.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            if (timestamp != null)
              Text(
                timestamp!,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: yakTheme.textSecondary),
              ),
          ],
        ),
      ),
    );
  }
}

/// Chat category tab chip (Supernova: Chat-Category).
class YakChatCategory extends StatelessWidget {
  const YakChatCategory({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakChip(label: label, selected: selected, onTap: onTap);
  }
}
