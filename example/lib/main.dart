import 'package:flutter/material.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  runApp(const YakDesignCatalogApp());
}

class YakDesignCatalogApp extends StatelessWidget {
  const YakDesignCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yak Design Catalog',
      theme: YakTheme.light(),
      darkTheme: YakTheme.dark(),
      home: const ComponentIndexPage(),
    );
  }
}

/// Browse all 160 Supernova components and open live previews.
class ComponentIndexPage extends StatelessWidget {
  const ComponentIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widgets = SupernovaComponentRegistry.widgets;
    final assets = SupernovaComponentRegistry.assets;
    final templates = SupernovaComponentRegistry.all
        .where((e) => e.kind == SupernovaComponentKind.template)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yak Component Index'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const LivePreviewPage()),
            ),
            child: const Text('Live previews'),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(context.yakTheme.spacingMd),
        children: [
          _SummaryCard(
            title: 'Supernova coverage',
            lines: [
              '${SupernovaComponentRegistry.all.length} Figma components',
              '${widgets.length} Flutter widgets',
              '${assets.length} asset libraries',
              '${templates.length} templates',
            ],
          ),
          SizedBox(height: context.yakTheme.spacingLg),
          Text(
            'Flutter widgets',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: context.yakTheme.spacingSm),
          for (final entry in widgets)
            ListTile(
              dense: true,
              title: Text(entry.supernovaName),
              trailing: Text(
                entry.flutterWidget ?? '',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          SizedBox(height: context.yakTheme.spacingLg),
          Text(
            'Asset libraries',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: context.yakTheme.spacingSm),
          for (final entry in assets)
            ListTile(
              dense: true,
              title: Text(entry.supernovaName),
              subtitle: const Text('Bundle SVG/PNG in assets/'),
            ),
        ],
      ),
    );
  }
}

class LivePreviewPage extends StatefulWidget {
  const LivePreviewPage({super.key});

  @override
  State<LivePreviewPage> createState() => _LivePreviewPageState();
}

class _LivePreviewPageState extends State<LivePreviewPage> {
  var _tapCount = 0;
  var _toggle = true;
  var _checkbox = false;
  var _slider = 40.0;
  var _rating = 4.0;
  var _segment = 0;
  var _bottomIndex = 0;
  final _selectedChips = <String>{'Express'};

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Live previews')),
      body: ListView(
        padding: EdgeInsets.all(yakTheme.spacingMd),
        children: [
          Text('Buttons', style: textTheme.titleLarge),
          SizedBox(height: yakTheme.spacingMd),
          YakButton(
            label: 'Primary',
            onPressed: () => setState(() => _tapCount++),
          ),
          SizedBox(height: yakTheme.spacingSm),
          Text('Tapped $_tapCount'),
          SizedBox(height: yakTheme.spacingSm),
          const YakSecondaryButton(label: 'Secondary', onPressed: null),
          SizedBox(height: yakTheme.spacingSm),
          YakDestructiveButton(label: 'Delete', onPressed: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakTextButton(label: 'Cancel', onPressed: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakButtonGroup(
            children: [
              YakCloseButton(onPressed: () {}),
              YakLoveButton(onChanged: (_) {}),
            ],
          ),
          SizedBox(height: yakTheme.spacingLg),
          Text('Inputs', style: textTheme.titleLarge),
          SizedBox(height: yakTheme.spacingMd),
          const YakTextField(label: 'Name', hint: 'Enter your name'),
          SizedBox(height: yakTheme.spacingMd),
          YakToggle(
            label: 'Notifications',
            value: _toggle,
            onChanged: (v) => setState(() => _toggle = v),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakCheckbox(
            label: 'Accept terms',
            value: _checkbox,
            onChanged: (v) => setState(() => _checkbox = v),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakSlider(
            value: _slider,
            onChanged: (v) => setState(() => _slider = v),
            label: 'Volume',
          ),
          SizedBox(height: yakTheme.spacingLg),
          Text('Navigation & overlays', style: textTheme.titleLarge),
          SizedBox(height: yakTheme.spacingMd),
          const YakBreadcrumb(items: ['Home', 'Orders', 'Detail']),
          SizedBox(height: yakTheme.spacingMd),
          YakSegmentedControl(
            segments: const ['All', 'Active', 'Done'],
            selectedIndex: _segment,
            onChanged: (i) => setState(() => _segment = i),
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakButton(
            label: 'Open modal',
            onPressed: () => YakModal.show(
              context: context,
              modal: YakModal(
                title: 'Confirm',
                message: 'Proceed with this action?',
                primaryLabel: 'Confirm',
                onPrimary: () => Navigator.pop(context),
                secondaryLabel: 'Cancel',
                onSecondary: () => Navigator.pop(context),
              ),
            ),
          ),
          SizedBox(height: yakTheme.spacingLg),
          Text('Feedback & display', style: textTheme.titleLarge),
          SizedBox(height: yakTheme.spacingMd),
          const YakAlert(
            message: 'Saved successfully',
            variant: YakAlertVariant.success,
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakRating(
            value: _rating,
            onChanged: (v) => setState(() => _rating = v),
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakAvatarDescription(
            title: 'Rider name',
            subtitle: 'Online',
            initials: 'RN',
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakSelectorGroup(
            options: const ['Express', 'Same day', 'Scheduled'],
            selected: _selectedChips,
            onChanged: (o, selected) => setState(() {
              if (selected) {
                _selectedChips.add(o);
              } else {
                _selectedChips.remove(o);
              }
            }),
            allowMultiple: true,
          ),
          SizedBox(height: yakTheme.spacingLg),
          Text('Domain cards', style: textTheme.titleLarge),
          SizedBox(height: yakTheme.spacingMd),
          const YakCardTransaction(
            title: 'Delivery fee',
            amount: '+฿45',
            subtitle: 'Today',
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakProfileRider(name: 'Somchai K.', vehicle: 'Motorcycle'),
          SizedBox(height: yakTheme.spacingSm),
          const YakResultState(title: 'Payment complete', isSuccess: true),
          SizedBox(height: yakTheme.spacingXl),
        ],
      ),
      bottomNavigationBar: YakBottomNavigation(
        currentIndex: _bottomIndex,
        onTap: (i) => setState(() => _bottomIndex = i),
        items: const [
          YakBottomNavItem(
            label: 'Home',
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
          ),
          YakBottomNavItem(
            label: 'Orders',
            icon: Icons.receipt_long_outlined,
            selectedIcon: Icons.receipt_long,
          ),
          YakBottomNavItem(label: 'More', icon: Icons.more_horiz),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.title, required this.lines});

  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Container(
      padding: EdgeInsets.all(yakTheme.spacingMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: yakTheme.spacingSm),
          for (final line in lines) Text(line),
        ],
      ),
    );
  }
}
