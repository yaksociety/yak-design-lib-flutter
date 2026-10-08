import 'package:flutter/material.dart';
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

void main() {
  runApp(const YakDesignCatalogApp());
}

final _themeMode = ValueNotifier(ThemeMode.light);

class YakDesignCatalogApp extends StatelessWidget {
  const YakDesignCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeMode,
      builder: (context, mode, _) => MaterialApp(
        title: 'Yak Design Catalog',
        theme: YakTheme.light(),
        darkTheme: YakTheme.dark(),
        themeMode: mode,
        home: const ComponentIndexPage(),
      ),
    );
  }
}

class _ThemeModeToggle extends StatelessWidget {
  const _ThemeModeToggle();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      tooltip: isDark ? 'Light mode' : 'Dark mode',
      icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
      onPressed: () =>
          _themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark,
    );
  }
}

/// Every role from the Figma "Semantic: Color" collection for the active mode.
class SemanticColorsPage extends StatelessWidget {
  const SemanticColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final colors = context.yakColors;
    final textTheme = Theme.of(context).textTheme;
    final groups = <String, List<MapEntry<String, Color>>>{};
    for (final entry in colors.toMap().entries) {
      final parts = entry.key.split('/');
      final group = parts.take(parts.length - 1).join(' / ');
      groups.putIfAbsent(group, () => []).add(entry);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Semantic colors'),
        actions: const [_ThemeModeToggle()],
      ),
      body: ListView(
        padding: EdgeInsets.all(yakTheme.spacingMd),
        children: [
          for (final group in groups.entries) ...[
            Padding(
              padding: EdgeInsets.only(
                top: yakTheme.spacingLg,
                bottom: yakTheme.spacingSm,
              ),
              child: Text(group.key, style: textTheme.titleMedium),
            ),
            for (final entry in group.value)
              Padding(
                padding: EdgeInsets.symmetric(vertical: yakTheme.spacingXs),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: entry.value,
                        borderRadius: BorderRadius.circular(yakTheme.radiusSm),
                        border: Border.all(color: colors.strokeBase),
                      ),
                    ),
                    SizedBox(width: yakTheme.spacingMd),
                    Expanded(
                      child: Text(
                        entry.key.split('/').last,
                        style: textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      '#${entry.value.toARGB32().toRadixString(16).toUpperCase().padLeft(8, '0')}',
                      style: textTheme.labelSmall?.copyWith(
                        color: colors.textIconsBaseSecond,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}

/// Browse all Supernova components and open live previews.
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
              MaterialPageRoute<void>(
                builder: (_) => const SemanticColorsPage(),
              ),
            ),
            child: const Text('Colors'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const LivePreviewPage()),
            ),
            child: const Text('Live previews'),
          ),
          const _ThemeModeToggle(),
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
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LivePreviewPage(),
                ),
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
  var _currentPage = 1;
  var _chipSelected = true;
  var _tileSelected = true;
  var _paymentSelected = true;
  var _riderSelected = true;
  var _jobSelected = false;
  var _parcelSelected = false;
  var _footerCheckbox = false;
  var _loved = false;
  String? _selectValue;
  String? _country;
  final _selectedChips = <String>{'Express'};
  final _checkboxGroup = <String>{'Option A'};

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: YakTopNavigation(
        title: 'Live previews',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: const [_ThemeModeToggle()],
      ),
      body: ListView(
        padding: EdgeInsets.all(yakTheme.spacingMd),
        children: [
          _section(context, 'Buttons'),
          YakButton(
            label: 'Primary (YakButton)',
            onPressed: () => setState(() => _tapCount++),
          ),
          SizedBox(height: yakTheme.spacingSm),
          Text('Tapped $_tapCount', style: textTheme.bodySmall),
          SizedBox(height: yakTheme.spacingSm),
          YakPrimaryButton(label: 'Primary button', onPressed: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakSecondaryButton(label: 'Secondary', onPressed: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakDestructiveButton(label: 'Delete', onPressed: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakTextButton(label: 'Cancel', onPressed: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakButtonGroup(
            children: [
              YakCloseButton(onPressed: () {}),
              YakLoveButton(
                isLoved: _loved,
                onChanged: (v) => setState(() => _loved = v),
              ),
              YakDisplayIcon(icon: Icons.add, onPressed: () {}),
            ],
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakActions(
            primaryLabel: 'Confirm',
            onPrimaryPressed: () {},
            secondaryLabel: 'Cancel',
            onSecondaryPressed: () {},
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakActionsWithCancel(
            confirmLabel: 'Submit',
            onConfirmPressed: () {},
            onCancelPressed: () {},
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakSocialButtonGroup(),

          _section(context, 'Inputs'),
          const YakLabel(text: 'Email', isRequired: true),
          SizedBox(height: yakTheme.spacingSm),
          const YakHintText(text: 'This is a hint text to help user.'),
          SizedBox(height: yakTheme.spacingMd),
          const YakTextField(
            label: 'Name',
            hint: 'Input text',
            helperText: 'This is a hint text to help user.',
            isRequired: true,
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakTextField(
            label: 'Email',
            hint: 'Input text',
            errorText: 'Invalid email address',
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakTextArea(label: 'Notes', hint: 'Write here…'),
          SizedBox(height: yakTheme.spacingMd),
          YakInputFieldShell(
            label: 'Custom shell',
            field: TextField(
              decoration: InputDecoration(
                hintText: 'Wrapped field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(yakTheme.radiusMd),
                ),
              ),
            ),
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakSearchField(hint: 'Search orders'),
          SizedBox(height: yakTheme.spacingMd),
          const YakSearchDisplay(),
          SizedBox(height: yakTheme.spacingMd),
          YakSearchAction(onAction: () {}),
          SizedBox(height: yakTheme.spacingMd),
          YakSearchResult(
            title: 'Order #123',
            subtitle: 'Delivered',
            onTap: () {},
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakVerificationCodeInput(),
          SizedBox(height: yakTheme.spacingMd),
          const YakPhoneNumberField(),
          SizedBox(height: yakTheme.spacingMd),
          YakChatInput(onSend: () {}),
          SizedBox(height: yakTheme.spacingMd),
          YakCommentInput(onSend: () {}),
          SizedBox(height: yakTheme.spacingMd),
          Row(
            children: const [
              YakInputIndicator(type: YakInputIndicatorType.active),
              SizedBox(width: 16),
              YakInputIndicator(
                type: YakInputIndicatorType.positive,
                label: 'Active',
              ),
            ],
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakInputSteps(stepCount: 5, currentStep: 2),
          SizedBox(height: yakTheme.spacingMd),
          const YakInputTitleProgress(title: 'สำเร็จ'),
          SizedBox(height: yakTheme.spacingMd),
          YakSelect<String>(
            label: 'City',
            items: const ['Bangkok', 'Chiang Mai', 'Phuket'],
            itemLabel: (v) => v,
            value: _selectValue,
            hint: 'Select city',
            onChanged: (v) => setState(() => _selectValue = v),
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakCountrySelect(
            value: _country,
            onChanged: (v) => setState(() => _country = v),
          ),
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
          YakCheckboxGroup(
            options: const ['Option A', 'Option B', 'Option C'],
            selected: _checkboxGroup,
            onChanged: (option, selected) => setState(() {
              if (selected) {
                _checkboxGroup.add(option);
              } else {
                _checkboxGroup.remove(option);
              }
            }),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakSlider(
            value: _slider,
            onChanged: (v) => setState(() => _slider = v),
            label: 'Volume',
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakFileUpload(onTap: () {}),
          SizedBox(height: yakTheme.spacingMd),
          const YakRichTextEditor(label: 'Description'),
          SizedBox(height: yakTheme.spacingSm),
          const YakRichTextToolbar(),
          SizedBox(height: yakTheme.spacingMd),
          YakAddressPicker(
            label: 'Delivery address',
            value: '123 Sukhumvit Rd',
            onTap: () {},
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakDisplayDate(date: DateTime(2026, 9, 17)),
          SizedBox(height: yakTheme.spacingMd),
          YakCalendar(label: 'Pickup date', onDateSelected: (_) {}),
          SizedBox(height: yakTheme.spacingMd),
          YakLocationPicker(address: 'Bangkok, Thailand', onTap: () {}),
          SizedBox(height: yakTheme.spacingMd),
          const YakMapPointer(label: 'Drop-off'),

          _section(context, 'Navigation'),
          const YakBreadcrumb(items: ['Home', 'Orders', 'Detail']),
          SizedBox(height: yakTheme.spacingMd),
          YakSegmentedControl(
            segments: const ['All', 'Active', 'Done'],
            selectedIndex: _segment,
            onChanged: (i) => setState(() => _segment = i),
          ),
          SizedBox(height: yakTheme.spacingMd),
          SizedBox(
            height: 160,
            child: YakTabs(
              tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
              children: const [
                Center(child: Text('One')),
                Center(child: Text('Two')),
                Center(child: Text('Three')),
              ],
            ),
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakPagination(
            pageCount: 5,
            currentPage: _currentPage,
            onPageTap: (p) => setState(() => _currentPage = p),
          ),

          _section(context, 'Overlays'),
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
          SizedBox(height: yakTheme.spacingSm),
          YakSecondaryButton(
            label: 'Open bottom sheet',
            onPressed: () => YakBottomSheet.show(
              context: context,
              sheet: YakBottomSheet(
                title: 'Filters',
                child: YakCheckbox(
                  label: 'Express only',
                  value: false,
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
          SizedBox(height: yakTheme.spacingMd),
          SizedBox(
            height: 220,
            child: YakFooterSheet(
              checkboxLabel: 'Remember choice',
              checkboxValue: _footerCheckbox,
              onCheckboxChanged: (v) => setState(() => _footerCheckbox = v),
              primaryLabel: 'Continue',
              onPrimary: () {},
              secondaryLabel: 'Back',
              onSecondary: () {},
              child: const Center(child: Text('Sheet content')),
            ),
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakTooltip(
            message: 'Helpful tip',
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ),

          _section(context, 'Feedback'),
          const YakAlert(
            message: 'Saved successfully',
            variant: YakAlertVariant.success,
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakButton(
            label: 'Show notification toast',
            onPressed: () => YakNotification.show(
              context,
              const YakNotification(
                message: 'Order placed',
                variant: YakAlertVariant.success,
              ),
            ),
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakNotification(
            message: 'Inline notification preview',
            variant: YakAlertVariant.info,
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakNotificationCard(
            title: 'New order',
            message: 'You have a delivery request',
            timestamp: '5m',
            unread: true,
            onTap: () {},
          ),

          _section(context, 'Display'),
          const YakAvatar(initials: 'AB'),
          SizedBox(height: yakTheme.spacingMd),
          const YakAvatarDescription(
            title: 'Rider name',
            subtitle: 'Online',
            initials: 'RN',
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakAvatarGroup(initials: ['AB', 'CD', 'EF', 'GH']),
          SizedBox(height: yakTheme.spacingMd),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              YakBadge(label: 'New'),
              YakBadge(label: 'Primary', variant: YakBadgeVariant.primary),
            ],
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakBanner(title: 'Promo', message: '20% off today'),
          SizedBox(height: yakTheme.spacingMd),
          YakSectionHeader(
            title: 'Recent orders',
            actionLabel: 'See all',
            onAction: () {},
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakActionItem(
            title: 'Settings',
            subtitle: 'Account & security',
            icon: Icons.settings,
            onTap: () {},
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakTile(
            title: 'Express',
            subtitle: 'Fastest delivery',
            selected: _tileSelected,
            onTap: () => setState(() => _tileSelected = !_tileSelected),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakChip(
            label: 'Express',
            selected: _chipSelected,
            onTap: () => setState(() => _chipSelected = !_chipSelected),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakRatingChip(rating: 4.5, onTap: () {}),
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
          SizedBox(height: yakTheme.spacingMd),
          const YakHeadline(text: 'Welcome back'),
          SizedBox(height: yakTheme.spacingSm),
          const YakTitle(text: 'Order details'),
          SizedBox(height: yakTheme.spacingMd),
          YakDetailExpand(
            title: 'Details',
            child: Text('Hidden content', style: textTheme.bodyMedium),
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakIndicator(),
          SizedBox(height: yakTheme.spacingMd),
          const YakComment(
            author: 'User',
            message: 'Looks good!',
            timestamp: '2m ago',
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakChatBubble(message: 'Hello!', isMine: true),
          SizedBox(height: yakTheme.spacingSm),
          const YakChatBubble(message: 'On my way', isMine: false),
          SizedBox(height: yakTheme.spacingMd),
          YakChatCategory(label: 'Support', selected: true, onTap: () {}),

          _section(context, 'Data'),
          const YakProgressBar(value: 0.6, label: 'Uploading'),
          SizedBox(height: yakTheme.spacingMd),
          const Row(
            children: [
              YakProgressCircle(value: 0.75),
              SizedBox(width: 24),
              YakProgressSemicircle(value: 0.5),
            ],
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakRating(
            value: _rating,
            onChanged: (v) => setState(() => _rating = v),
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakSteps(steps: ['Cart', 'Pay', 'Done'], currentStep: 1),
          SizedBox(height: yakTheme.spacingMd),
          YakStepper(
            currentStep: 1,
            steps: const [Text('Address'), Text('Payment'), Text('Review')],
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakDividerStepper(
            labels: ['Invite', 'Earn', 'Redeem'],
            currentIndex: 1,
          ),
          SizedBox(height: yakTheme.spacingMd),
          const YakTitleProgress(title: 'Profile completion', progress: 0.7),
          SizedBox(height: yakTheme.spacingMd),
          const YakPasswordIndicator(strength: 0.8),
          SizedBox(height: yakTheme.spacingMd),
          YakCarousel(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const Center(child: Text('Slide 1')),
              ),
              Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: const Center(child: Text('Slide 2')),
              ),
            ],
          ),
          SizedBox(height: yakTheme.spacingMd),
          YakSwipeAction(
            onDelete: () {},
            child: const ListTile(title: Text('Swipe me to delete')),
          ),

          _section(context, 'Surfaces'),
          YakAccordion(
            title: 'FAQ',
            subtitle: 'Tap to expand',
            child: Text('Answer content here.', style: textTheme.bodyMedium),
          ),

          _section(context, 'Domain cards'),
          YakDomainCard(
            child: Text('Generic domain card', style: textTheme.bodyMedium),
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakCardFinanceSummary(balance: '฿1,250', change: '+12%'),
          SizedBox(height: yakTheme.spacingSm),
          const YakCardMessage(
            title: 'Support',
            message: 'Your ticket was updated',
            timestamp: 'Today',
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakCardProgress(title: 'Goal', progress: 0.65),
          SizedBox(height: yakTheme.spacingSm),
          const YakCardTransaction(
            title: 'Delivery fee',
            amount: '+฿45',
            subtitle: 'Today',
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakCardTransfer(
            from: 'Wallet',
            to: 'Bank',
            amount: '฿500',
            status: 'Pending',
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakFinanceSummary(income: '฿5,000', expense: '฿1,200'),
          SizedBox(height: yakTheme.spacingSm),
          const YakEarningSummary(total: '฿850'),
          SizedBox(height: yakTheme.spacingSm),
          const YakEarningActivityCard(
            title: 'Trip #42',
            amount: '+฿32',
            time: '10:30',
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakEarningProgress(target: 1000, current: 650),
          SizedBox(height: yakTheme.spacingSm),
          const YakEarningRate(rate: '฿45/hr'),
          SizedBox(height: yakTheme.spacingSm),
          const YakEarningType(type: 'Peak hours'),
          SizedBox(height: yakTheme.spacingSm),
          const YakFeatureCard(
            title: 'Dark mode',
            description: 'System-wide theme',
            votes: 42,
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakFeatureComment(author: 'Alex', comment: 'Need this ASAP'),
          SizedBox(height: yakTheme.spacingSm),
          const YakFeatureProgress(title: 'In development', progress: 0.4),
          SizedBox(height: yakTheme.spacingSm),
          YakFeatureVoteCta(onVote: () {}),
          SizedBox(height: yakTheme.spacingSm),
          const YakProfileRider(
            name: 'Somchai K.',
            vehicle: 'Motorcycle',
            rating: 4.8,
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakVehicleCard(model: 'Honda Click', plate: '1กก 1234'),
          SizedBox(height: yakTheme.spacingSm),
          YakRiderType(
            type: 'Motorcycle',
            selected: _riderSelected,
            onTap: () => setState(() => _riderSelected = !_riderSelected),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakJobType(
            type: 'Food delivery',
            selected: _jobSelected,
            onTap: () => setState(() => _jobSelected = !_jobSelected),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakParcelType(
            type: 'Small box',
            selected: _parcelSelected,
            onTap: () => setState(() => _parcelSelected = !_parcelSelected),
          ),
          SizedBox(height: yakTheme.spacingSm),
          YakAdditionalService(label: 'Insurance', onTap: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakPaymentMethod(
            label: 'PromptPay',
            selected: _paymentSelected,
            onTap: () => setState(() => _paymentSelected = !_paymentSelected),
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakPaymentFail(),
          SizedBox(height: yakTheme.spacingSm),
          const YakPayoutState(status: 'Processing'),
          SizedBox(height: yakTheme.spacingSm),
          YakPayoutExpand(
            title: 'Payout details',
            child: Text('Breakdown…', style: textTheme.bodyMedium),
          ),
          SizedBox(height: yakTheme.spacingSm),
          const YakTransferStatus(status: 'Completed', amount: '฿500'),
          SizedBox(height: yakTheme.spacingSm),
          const YakProcessStatus(step: 2, total: 4),
          SizedBox(height: yakTheme.spacingSm),
          const YakProcessCard(title: 'Verification', step: 1, total: 3),
          SizedBox(height: yakTheme.spacingSm),
          const YakDocumentState(status: 'Under review'),
          SizedBox(height: yakTheme.spacingSm),
          YakDocumentActionItem(title: 'Upload ID', onTap: () {}),
          SizedBox(height: yakTheme.spacingSm),
          YakConfirmDelegate(name: 'Jane', onConfirm: () {}),
          SizedBox(height: yakTheme.spacingSm),
          const YakIncentive(title: 'Complete 10 trips', reward: '฿100 bonus'),
          SizedBox(height: yakTheme.spacingSm),
          const YakReferralBonus(amount: '฿50'),
          SizedBox(height: yakTheme.spacingSm),
          const YakReferralCodeCard(code: 'YAK2026'),
          SizedBox(height: yakTheme.spacingSm),
          const YakCreditBannerBalance(balance: '฿200 credit'),
          SizedBox(height: yakTheme.spacingSm),
          const YakUserCommentCard(author: 'User', comment: 'Great service!'),
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

  Widget _section(BuildContext context, String title) {
    final yakTheme = context.yakTheme;
    return Padding(
      padding: EdgeInsets.only(
        top: yakTheme.spacingLg,
        bottom: yakTheme.spacingMd,
      ),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
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
        color: context.yakColors.backgroundPrimarySecond,
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
