import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

/// Bottom tab item for [YakBottomNavigation].
class YakBottomNavItem {
  const YakBottomNavItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
}

/// App bottom navigation bar (Supernova: bottom-navigation).
class YakBottomNavigation extends StatelessWidget {
  const YakBottomNavigation({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<YakBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        for (final item in items)
          NavigationDestination(
            icon: Icon(item.icon),
            selectedIcon: Icon(item.selectedIcon ?? item.icon),
            label: item.label,
          ),
      ],
    );
  }
}

/// Top app bar with optional actions (Supernova: top-navigation).
class YakTopNavigation extends StatelessWidget implements PreferredSizeWidget {
  const YakTopNavigation({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }
}

/// Breadcrumb trail (Supernova: Breadcrumb).
class YakBreadcrumb extends StatelessWidget {
  const YakBreadcrumb({
    super.key,
    required this.items,
    this.onTap,
  });

  final List<String> items;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final style = Theme.of(context).textTheme.bodySmall;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: yakTheme.spacingXs,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0)
            Icon(Icons.chevron_right, size: 16, color: yakTheme.textSecondary),
          GestureDetector(
            onTap: onTap == null || i == items.length - 1 ? null : () => onTap!(i),
            child: Text(
              items[i],
              style: style?.copyWith(
                color: i == items.length - 1
                    ? Theme.of(context).colorScheme.onSurface
                    : yakTheme.textSecondary,
                fontWeight: i == items.length - 1 ? FontWeight.w600 : null,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Tab bar with pages (Supernova: Tabs).
class YakTabs extends StatelessWidget {
  const YakTabs({
    super.key,
    required this.tabs,
    required this.children,
    this.initialIndex = 0,
  });

  final List<String> tabs;
  final List<Widget> children;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    assert(tabs.length == children.length);
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(tabs: [for (final t in tabs) Tab(text: t)]),
          Expanded(
            child: TabBarView(children: children),
          ),
        ],
      ),
    );
  }
}

/// Page indicator dots (Supernova: Pagination).
class YakPagination extends StatelessWidget {
  const YakPagination({
    super.key,
    required this.pageCount,
    required this.currentPage,
    this.onPageTap,
  });

  final int pageCount;
  final int currentPage;
  final ValueChanged<int>? onPageTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final active = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < pageCount; i++) ...[
          if (i > 0) SizedBox(width: yakTheme.spacingXs),
          GestureDetector(
            onTap: onPageTap == null ? null : () => onPageTap!(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: i == currentPage ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: i == currentPage ? active : yakTheme.borderDefault,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
