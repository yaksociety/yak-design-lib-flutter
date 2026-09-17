// GENERATED — run: python3 tool/generate_supernova_components.py

/// How a Supernova Figma component is represented in Flutter.
enum SupernovaComponentKind {
  /// Hand-written Flutter widget in this package.
  widget,

  /// Static asset library (SVG/PNG in assets/).
  asset,

  /// Figma layout template — compose with other widgets.
  template,
}

/// Maps a Supernova Figma component to its Flutter representation.
class SupernovaComponentEntry {
  const SupernovaComponentEntry({
    required this.supernovaId,
    required this.supernovaName,
    required this.kind,
    this.flutterWidget,
  });

  /// Stable Supernova / Figma component id.
  final String supernovaId;
  final String supernovaName;
  final SupernovaComponentKind kind;
  final String? flutterWidget;
}

/// All top-level Supernova / Figma components in design system 839081.
abstract final class SupernovaComponentRegistry {
  static const List<SupernovaComponentEntry> all = [
    SupernovaComponentEntry(supernovaId: '19ccbeb0-5236-4925-9492-7671892dac79', supernovaName: '.Card footer', kind: SupernovaComponentKind.template),
    SupernovaComponentEntry(supernovaId: 'bacc0d19-2623-4d53-b5d0-2e606291765d', supernovaName: '.Card header', kind: SupernovaComponentKind.template),
    SupernovaComponentEntry(supernovaId: '7d51e635-4f30-4408-9b51-b1778895ac55', supernovaName: '.Legend', kind: SupernovaComponentKind.template),
    SupernovaComponentEntry(supernovaId: '0cc8b97f-2a91-4b9f-aaf7-683b3881e9ad', supernovaName: '.Side menu header', kind: SupernovaComponentKind.template),
    SupernovaComponentEntry(supernovaId: '0f33c42a-2d77-42bb-8d90-4351a9e0b4d4', supernovaName: 'Accordion', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAccordion'),
    SupernovaComponentEntry(supernovaId: '3d54ba92-d239-4463-88c2-0620a7e51783', supernovaName: 'Action-item', kind: SupernovaComponentKind.widget, flutterWidget: 'YakActionItem'),
    SupernovaComponentEntry(supernovaId: '11bb820c-e9e5-464f-a4ca-90f27d5e0a6f', supernovaName: 'Actions', kind: SupernovaComponentKind.widget, flutterWidget: 'YakActions'),
    SupernovaComponentEntry(supernovaId: '67a8cdca-9a70-43fc-ac8c-22e3393196cf', supernovaName: 'Additional-service', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAdditionalService'),
    SupernovaComponentEntry(supernovaId: '5b35b04b-d54d-4597-b67d-ad5b9296f85d', supernovaName: 'address-picker', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAddressPicker'),
    SupernovaComponentEntry(supernovaId: '7f9b36a2-5306-4010-affb-8e8017dddcd8', supernovaName: 'Alert', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAlert'),
    SupernovaComponentEntry(supernovaId: 'd0983b5a-7ee2-4db0-a758-e563d3e9c7b8', supernovaName: 'Anatomy Dot', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '3f3ccb95-aaf4-439f-b33f-e894ec1f831b', supernovaName: 'Android', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '559113f8-c3e7-4300-be65-bb93fc49b11c', supernovaName: 'Avatar', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAvatar'),
    SupernovaComponentEntry(supernovaId: '70137393-e401-4a2f-8bac-1128dcd99127', supernovaName: 'Avatar & description', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAvatarDescription'),
    SupernovaComponentEntry(supernovaId: '42b009a9-f8bb-48bc-957c-37fcb98f5616', supernovaName: 'Avatar group', kind: SupernovaComponentKind.widget, flutterWidget: 'YakAvatarGroup'),
    SupernovaComponentEntry(supernovaId: 'c669468e-e4a3-48b1-92ee-62a8ae25ae97', supernovaName: 'Badge', kind: SupernovaComponentKind.widget, flutterWidget: 'YakBadge'),
    SupernovaComponentEntry(supernovaId: 'ff7ca0c5-dc2e-4663-a59f-2c8e1db79261', supernovaName: 'Bank Logos', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'a8fbd706-6f82-45d9-ae7e-67be95e77f95', supernovaName: 'Banner', kind: SupernovaComponentKind.widget, flutterWidget: 'YakBanner'),
    SupernovaComponentEntry(supernovaId: 'e9314c72-bfee-464c-ae8c-ac4dc5be2a6b', supernovaName: 'bottom-navigation', kind: SupernovaComponentKind.widget, flutterWidget: 'YakBottomNavigation'),
    SupernovaComponentEntry(supernovaId: '1619420b-8032-4043-9459-37cd1b5ecd78', supernovaName: 'BottomSheet', kind: SupernovaComponentKind.widget, flutterWidget: 'YakBottomSheet'),
    SupernovaComponentEntry(supernovaId: '44a18e53-b497-4d30-8d38-0581370065a3', supernovaName: 'Breadcrumb', kind: SupernovaComponentKind.widget, flutterWidget: 'YakBreadcrumb'),
    SupernovaComponentEntry(supernovaId: '8b8ddd89-39bc-43af-b0ad-7ff10e34ab7e', supernovaName: 'Button', kind: SupernovaComponentKind.widget, flutterWidget: 'YakButton'),
    SupernovaComponentEntry(supernovaId: 'b9ce3137-c73b-45f4-9a19-6c13d6987408', supernovaName: 'Button Close', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCloseButton'),
    SupernovaComponentEntry(supernovaId: '2d8ec950-9212-4fb5-a41a-1c7609291381', supernovaName: 'Button group', kind: SupernovaComponentKind.widget, flutterWidget: 'YakButtonGroup'),
    SupernovaComponentEntry(supernovaId: '4ec1f459-79d6-4a46-be7d-880f2cb16da2', supernovaName: 'Button Love', kind: SupernovaComponentKind.widget, flutterWidget: 'YakLoveButton'),
    SupernovaComponentEntry(supernovaId: '635bb6d9-d2ae-46e6-9717-7fd6f701ee14', supernovaName: 'Calendar', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCalendar'),
    SupernovaComponentEntry(supernovaId: 'b4342bac-0219-44a8-994a-a203a3bc2f23', supernovaName: 'Calendar Dropdown', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCalendarDropdown'),
    SupernovaComponentEntry(supernovaId: 'd8856301-af17-46b5-9205-5b43ec47f51d', supernovaName: 'Card-FinanceSummary', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCardFinanceSummary'),
    SupernovaComponentEntry(supernovaId: '9a40f1a4-663f-45b8-9ef3-56281bae26b0', supernovaName: 'Card-Message', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCardMessage'),
    SupernovaComponentEntry(supernovaId: '94901342-03de-4ce7-aa81-c9bb066909d4', supernovaName: 'Card-progress', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCardProgress'),
    SupernovaComponentEntry(supernovaId: '797af59e-cd07-40d7-8410-67a9718a0c67', supernovaName: 'Card-Transaction', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCardTransaction'),
    SupernovaComponentEntry(supernovaId: '3aeded35-620f-4168-9e00-b1c40759bd36', supernovaName: 'Card-Transfer', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCardTransfer'),
    SupernovaComponentEntry(supernovaId: '7350232c-ba60-4a41-b09c-8c7264742628', supernovaName: 'carousel', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCarousel'),
    SupernovaComponentEntry(supernovaId: '9cea123f-9ed1-4810-8a16-b30183dfe266', supernovaName: 'Chart', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'e13662f4-3e1e-4fc2-aff6-a73b71172ab2', supernovaName: 'Chat', kind: SupernovaComponentKind.widget, flutterWidget: 'YakChatInput'),
    SupernovaComponentEntry(supernovaId: '11d180b2-8df8-4ec8-abef-fa1bc01af1e1', supernovaName: 'Chat-Category', kind: SupernovaComponentKind.widget, flutterWidget: 'YakChatCategory'),
    SupernovaComponentEntry(supernovaId: '66405bc7-f228-476d-bb10-5f90dcd0f658', supernovaName: 'Checkbox', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCheckbox'),
    SupernovaComponentEntry(supernovaId: '194f853f-43f1-4a13-8999-d31ba94dba3b', supernovaName: 'Checkbox group', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCheckboxGroup'),
    SupernovaComponentEntry(supernovaId: '7b7c2062-9aa2-4ead-bb14-131cf6ab8592', supernovaName: 'chip', kind: SupernovaComponentKind.widget, flutterWidget: 'YakChip'),
    SupernovaComponentEntry(supernovaId: '9169036f-3619-429d-8fe5-a981d45e1196', supernovaName: 'Color', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '547eef3a-2960-4d81-a5b4-070e9f095672', supernovaName: 'Comment', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCommentInput'),
    SupernovaComponentEntry(supernovaId: 'b119c514-b775-4c15-b4a0-90d3923f4d0a', supernovaName: 'Component 1', kind: SupernovaComponentKind.template),
    SupernovaComponentEntry(supernovaId: '9f882987-5b05-46a2-aaae-9fbcf7bd1bc5', supernovaName: 'Component Icon', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '7a632884-6b9d-486e-a7ee-a4b1c305436f', supernovaName: 'confirm-delegate', kind: SupernovaComponentKind.widget, flutterWidget: 'YakConfirmDelegate'),
    SupernovaComponentEntry(supernovaId: '279fda45-662b-4cdd-9e30-9eb2c836de97', supernovaName: 'Country', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCountrySelect'),
    SupernovaComponentEntry(supernovaId: '6b49ecf6-7eb0-42a5-b7f8-deac2bab0e43', supernovaName: 'Credit Banner Balance', kind: SupernovaComponentKind.widget, flutterWidget: 'YakCreditBannerBalance'),
    SupernovaComponentEntry(supernovaId: '137fce40-5834-4b87-b170-bed5e28b1d1d', supernovaName: 'Detail-expand', kind: SupernovaComponentKind.widget, flutterWidget: 'YakDetailExpand'),
    SupernovaComponentEntry(supernovaId: '5ecbbfdc-3576-4f4a-897b-c962340927a0', supernovaName: 'Display Date', kind: SupernovaComponentKind.widget, flutterWidget: 'YakDisplayDate'),
    SupernovaComponentEntry(supernovaId: '03821855-8a87-4978-8574-a0c3a310ad17', supernovaName: 'Display Icon', kind: SupernovaComponentKind.widget, flutterWidget: 'YakDisplayIcon'),
    SupernovaComponentEntry(supernovaId: '837a967b-1a36-417f-aa01-a74b57fec8b2', supernovaName: 'Divider stepper', kind: SupernovaComponentKind.widget, flutterWidget: 'YakDividerStepper'),
    SupernovaComponentEntry(supernovaId: 'bc322855-8a81-403a-83ca-200f367e3851', supernovaName: 'Document Action-item', kind: SupernovaComponentKind.widget, flutterWidget: 'YakDocumentActionItem'),
    SupernovaComponentEntry(supernovaId: '3b21e3fd-d9fd-4de8-a01e-9cdddc97c579', supernovaName: 'Document-state', kind: SupernovaComponentKind.widget, flutterWidget: 'YakDocumentState'),
    SupernovaComponentEntry(supernovaId: '4ad20b71-38cb-471f-9022-b3949fff2ce2', supernovaName: 'Earning-progress', kind: SupernovaComponentKind.widget, flutterWidget: 'YakEarningProgress'),
    SupernovaComponentEntry(supernovaId: 'caaf10db-d3f2-46c7-b01a-b9bc06c7ad4a', supernovaName: 'Earning-rate', kind: SupernovaComponentKind.widget, flutterWidget: 'YakEarningRate'),
    SupernovaComponentEntry(supernovaId: 'ee25f588-bda1-4e19-af3c-6f4c20b34549', supernovaName: 'Earning-Type', kind: SupernovaComponentKind.widget, flutterWidget: 'YakEarningType'),
    SupernovaComponentEntry(supernovaId: '55274417-9b09-4a49-8310-e737ac5287de', supernovaName: 'EarningActivityCard', kind: SupernovaComponentKind.widget, flutterWidget: 'YakEarningActivityCard'),
    SupernovaComponentEntry(supernovaId: 'f68eb453-9e8e-4fa1-a389-7254f060f98b', supernovaName: 'EarningSummary', kind: SupernovaComponentKind.widget, flutterWidget: 'YakEarningSummary'),
    SupernovaComponentEntry(supernovaId: '88aad2d9-ee08-4814-8c7d-fdcdc0e8abb4', supernovaName: 'element', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '7dfbc518-b0da-4e80-b85a-a9bd8103a01d', supernovaName: 'Feature-card', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFeatureCard'),
    SupernovaComponentEntry(supernovaId: '7aed33d2-8d1e-47f1-bc15-a6a61eeb7c2e', supernovaName: 'Feature-comment', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFeatureComment'),
    SupernovaComponentEntry(supernovaId: '947ac4ff-7fd1-4eea-a7e1-56ae648d3d0d', supernovaName: 'Feature-Progress', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFeatureProgress'),
    SupernovaComponentEntry(supernovaId: 'ad27a2f6-1f28-4aa2-9883-c7db74331863', supernovaName: 'Feature-vote-CTA', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFeatureVoteCta'),
    SupernovaComponentEntry(supernovaId: '41f2014c-2d00-41e3-adaf-d500842e8166', supernovaName: 'File extensions icon', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'bddc0577-3f7b-4ede-a7a7-a7f4d452a327', supernovaName: 'File Upload', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFileUpload'),
    SupernovaComponentEntry(supernovaId: '1b4dbadb-be03-4b99-88ee-200c7f57881e', supernovaName: 'filter-chip', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFilterChip'),
    SupernovaComponentEntry(supernovaId: 'e94521a8-53cc-4981-95a4-0c8b44920fea', supernovaName: 'FinanceSummary', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFinanceSummary'),
    SupernovaComponentEntry(supernovaId: 'd88be8da-6994-43ea-ab29-8fea7288f04a', supernovaName: 'FooterSheet', kind: SupernovaComponentKind.widget, flutterWidget: 'YakFooterSheet'),
    SupernovaComponentEntry(supernovaId: '60f90f26-1d76-4a35-82e0-7ecb7deba9e6', supernovaName: 'Freame Icon', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'debfc7ee-f04f-4724-8aed-1736a50a49c9', supernovaName: 'hint text', kind: SupernovaComponentKind.widget, flutterWidget: 'YakHintText'),
    SupernovaComponentEntry(supernovaId: '25377669-77b3-4a86-b954-563eabd2d644', supernovaName: 'home-indicator', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '6e49b513-463b-40f2-9ad1-f324483f3a73', supernovaName: 'hourglass', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'a584f961-2c37-4952-8b5b-268ff5546e34', supernovaName: 'Icon', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'e909b9dc-7e40-4b13-9472-c5ad134bc4e8', supernovaName: 'Icon Button', kind: SupernovaComponentKind.widget, flutterWidget: 'YakIconButton'),
    SupernovaComponentEntry(supernovaId: '23855b27-0db7-4283-a07c-db9bf452ad1d', supernovaName: 'ID Card', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '2541c119-4cfd-4e01-8c50-d5a93a34b158', supernovaName: 'illustration', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '8ea6db09-45f6-42f5-9754-a28f650bb415', supernovaName: 'image', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '16995272-2520-400f-9ee3-6247db273640', supernovaName: 'Indicator', kind: SupernovaComponentKind.widget, flutterWidget: 'YakInputIndicator'),
    SupernovaComponentEntry(supernovaId: '50aaecdf-89f5-4cfc-a10d-22dc86e038c7', supernovaName: 'Input field', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTextField'),
    SupernovaComponentEntry(supernovaId: 'ffaf0f8b-d746-4562-aae5-675462ad41af', supernovaName: 'Input Text area', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTextArea'),
    SupernovaComponentEntry(supernovaId: 'e91355ab-1907-4422-8eea-785c1c35c9f2', supernovaName: 'Input Verification code', kind: SupernovaComponentKind.widget, flutterWidget: 'YakVerificationCodeInput'),
    SupernovaComponentEntry(supernovaId: '82a258b3-8395-4f19-8e3a-5e3f7e055a32', supernovaName: 'iOS-push-notifications', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'cd9c7e9f-c4ed-4c6b-9a44-d9f5454db8b0', supernovaName: 'iPhone', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '5765dd88-d107-42f1-b11c-8a235058af26', supernovaName: 'Job-type', kind: SupernovaComponentKind.widget, flutterWidget: 'YakJobType'),
    SupernovaComponentEntry(supernovaId: 'fa698574-a4f4-4685-a010-48d164f16b77', supernovaName: 'Label', kind: SupernovaComponentKind.widget, flutterWidget: 'YakLabel'),
    SupernovaComponentEntry(supernovaId: '1140dbcd-49ff-4397-a3dd-36cd419d7fa1', supernovaName: 'location', kind: SupernovaComponentKind.widget, flutterWidget: 'YakLocationPicker'),
    SupernovaComponentEntry(supernovaId: '2656a1f8-d9f2-4a77-a51a-91dc253c0385', supernovaName: 'logo-app', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '981df66b-edbc-4919-9f87-22533c53a3b9', supernovaName: 'Map Pointer', kind: SupernovaComponentKind.widget, flutterWidget: 'YakMapPointer'),
    SupernovaComponentEntry(supernovaId: '573d5724-dcd0-43eb-80b3-ca86dc4db00c', supernovaName: 'Mobile Segmented Control', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSegmentedControl'),
    SupernovaComponentEntry(supernovaId: 'b129d553-0fcc-4024-a497-0ddb6f56eb91', supernovaName: 'MobileScreenTemplate', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'd8935fa0-63be-43e2-b706-0d4deccd2ad7', supernovaName: 'Modal', kind: SupernovaComponentKind.widget, flutterWidget: 'YakModal'),
    SupernovaComponentEntry(supernovaId: '2c020d81-84a5-4fb5-8835-fbd2a7ce7d06', supernovaName: 'Modal BG', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '29add46a-17a7-4ef3-8a09-99429a07ba42', supernovaName: 'Notification', kind: SupernovaComponentKind.widget, flutterWidget: 'YakNotification'),
    SupernovaComponentEntry(supernovaId: '864afd63-aff1-4eb8-8ee5-b9b503f7bac5', supernovaName: 'Notification-Card', kind: SupernovaComponentKind.widget, flutterWidget: 'YakNotificationCard'),
    SupernovaComponentEntry(supernovaId: '6047562c-25db-47a9-a3c4-f99e83ec1710', supernovaName: 'Pagination', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPagination'),
    SupernovaComponentEntry(supernovaId: '9324fd9d-fbe6-4bf5-bf7d-949b95de37bd', supernovaName: 'Parcel-type', kind: SupernovaComponentKind.widget, flutterWidget: 'YakParcelType'),
    SupernovaComponentEntry(supernovaId: 'aa51a7f2-8c13-49ff-85c8-93c5c396f545', supernovaName: 'Password indicator', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPasswordIndicator'),
    SupernovaComponentEntry(supernovaId: '5ab46010-01c7-4111-87f4-dca4113acb00', supernovaName: 'Payment', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPaymentMethod'),
    SupernovaComponentEntry(supernovaId: '1fd0f883-ad08-4176-a918-fab0cf67d4f3', supernovaName: 'Payment Logos', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'dc9d43e0-0604-4114-8372-c843c17b0ca8', supernovaName: 'payment-fail', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPaymentFail'),
    SupernovaComponentEntry(supernovaId: '34c26b4d-86c5-49c7-a882-9d1b48541839', supernovaName: 'Payout-expand', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPayoutExpand'),
    SupernovaComponentEntry(supernovaId: '2ed7c553-93c4-4784-bbce-a00678e12289', supernovaName: 'Payout-state', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPayoutState'),
    SupernovaComponentEntry(supernovaId: '33c2f843-1dd1-4d4a-a12e-ab06975b0523', supernovaName: 'Phone Number', kind: SupernovaComponentKind.widget, flutterWidget: 'YakPhoneNumberField'),
    SupernovaComponentEntry(supernovaId: 'ac142a39-6749-47f6-ad26-24078e89caf1', supernovaName: 'Pie Chart', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '9a18cc9e-44a6-4dd8-a39a-a45302ec4122', supernovaName: 'placement', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '9ef5a473-b36d-48d4-bd0d-8a169f3b4d6f', supernovaName: 'placement', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '5de9d202-e606-426b-a865-1299f3996eb7', supernovaName: 'process', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProcessStatus'),
    SupernovaComponentEntry(supernovaId: '4472756c-fa41-4cbb-8df6-5ca15fdbb908', supernovaName: 'processCard', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProcessCard'),
    SupernovaComponentEntry(supernovaId: '36bf808b-3603-48e8-ae58-7e5cc859d144', supernovaName: 'Profile-rider', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProfileRider'),
    SupernovaComponentEntry(supernovaId: '72437939-9842-4794-acc8-837cd227dfd7', supernovaName: 'progress', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProgress'),
    SupernovaComponentEntry(supernovaId: 'ff7c52c2-72b7-46f5-8236-a3462ad58d3e', supernovaName: 'Progress bar', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProgressBar'),
    SupernovaComponentEntry(supernovaId: '4a208180-1de8-4627-9648-17e1c8816d42', supernovaName: 'Progress circle', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProgressCircle'),
    SupernovaComponentEntry(supernovaId: '19110752-fa6d-49a7-bb1d-6488911c5891', supernovaName: 'Progress semicircle', kind: SupernovaComponentKind.widget, flutterWidget: 'YakProgressSemicircle'),
    SupernovaComponentEntry(supernovaId: '140bb4a7-9478-481c-acb5-e8c1eab9aa89', supernovaName: 'Project status', kind: SupernovaComponentKind.template),
    SupernovaComponentEntry(supernovaId: '407e0150-141c-493c-85e6-9adbce286e60', supernovaName: 'Rating', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRating'),
    SupernovaComponentEntry(supernovaId: '5964fc04-807d-4cb3-b190-48a1b6e3e432', supernovaName: 'Rating', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRating'),
    SupernovaComponentEntry(supernovaId: '6589b028-ddca-4990-a6a9-36e82a445904', supernovaName: 'Rating', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRating'),
    SupernovaComponentEntry(supernovaId: '97798a23-6919-4ba6-b804-f6fd2abd4fe2', supernovaName: 'Rating-Chip', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRatingChip'),
    SupernovaComponentEntry(supernovaId: '76bd9c95-11e3-49be-9b22-bb0457dd05b3', supernovaName: 'referral-bonus', kind: SupernovaComponentKind.widget, flutterWidget: 'YakReferralBonus'),
    SupernovaComponentEntry(supernovaId: 'b44fe442-7028-410e-8b5e-15bb3bd79ebe', supernovaName: 'referral-code-card', kind: SupernovaComponentKind.widget, flutterWidget: 'YakReferralCodeCard'),
    SupernovaComponentEntry(supernovaId: '265e9206-7875-4f19-8ae5-900a0509ca52', supernovaName: 'referral-stepper', kind: SupernovaComponentKind.widget, flutterWidget: 'YakReferralStepper'),
    SupernovaComponentEntry(supernovaId: '0d751f2b-f487-47f2-95bd-9fe7fd542dd7', supernovaName: 'Result-State', kind: SupernovaComponentKind.widget, flutterWidget: 'YakResultState'),
    SupernovaComponentEntry(supernovaId: '0659d4c1-c870-4d70-8d0d-53b307c1bff3', supernovaName: 'RichtextEditor', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRichTextEditor'),
    SupernovaComponentEntry(supernovaId: '8fba2b64-c77e-4452-b501-ca8586ddccaf', supernovaName: 'RichtextToolbar', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRichTextToolbar'),
    SupernovaComponentEntry(supernovaId: '5cc2f573-df31-4ad9-82ac-8d0c01eae31e', supernovaName: 'Rider-type', kind: SupernovaComponentKind.widget, flutterWidget: 'YakRiderType'),
    SupernovaComponentEntry(supernovaId: '88598f34-cf15-49ab-84ca-31310ad7a2b7', supernovaName: 'Scroll bar', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '35d4dd0c-b6c8-4522-ac64-c98dca2dfdd8', supernovaName: 'Search', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSearchField'),
    SupernovaComponentEntry(supernovaId: 'c1958c14-b748-442c-bd86-8ee75ccb1171', supernovaName: 'Search Action', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSearchAction'),
    SupernovaComponentEntry(supernovaId: 'c6a116df-0c63-46e6-b2de-72a02b27be49', supernovaName: 'Search Display', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSearchDisplay'),
    SupernovaComponentEntry(supernovaId: 'ee906da2-8568-4ae7-90ea-b81214a4ea68', supernovaName: 'Section-Header', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSectionHeader'),
    SupernovaComponentEntry(supernovaId: '909b329b-b9cf-42cd-b823-1ab1e1ef454c', supernovaName: 'Selector-Group', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSelectorGroup'),
    SupernovaComponentEntry(supernovaId: '2bae44a0-141c-4b3a-b2d5-13c6b1a58147', supernovaName: 'Selects', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSelect'),
    SupernovaComponentEntry(supernovaId: '3a395072-f3a3-4e8a-af2c-04a3425fc4a0', supernovaName: 'Slider', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSlider'),
    SupernovaComponentEntry(supernovaId: 'bbb53cf8-3c42-499d-851c-16b6ed78f771', supernovaName: 'Social button groups', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSocialButtonGroup'),
    SupernovaComponentEntry(supernovaId: 'a2c476df-7f27-4dbb-9409-a2b78141c2e4', supernovaName: 'Social platforms logos', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'baa2b3c5-7986-43d8-a94e-a211948655b1', supernovaName: 'status-bar', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '1cc90f08-abcd-49aa-818c-ddaf505e5684', supernovaName: 'Stepper', kind: SupernovaComponentKind.widget, flutterWidget: 'YakStepper'),
    SupernovaComponentEntry(supernovaId: 'e9aefb81-3489-44d2-9188-71df6f6a67c4', supernovaName: 'Steps', kind: SupernovaComponentKind.widget, flutterWidget: 'YakInputSteps'),
    SupernovaComponentEntry(supernovaId: '0a39a831-f6e0-4cc1-9ff8-1e26bb272722', supernovaName: 'Swipe left action', kind: SupernovaComponentKind.widget, flutterWidget: 'YakSwipeAction'),
    SupernovaComponentEntry(supernovaId: 'b0d70e73-6c38-4a56-851a-386c01f13851', supernovaName: 'Tabs', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTabs'),
    SupernovaComponentEntry(supernovaId: 'e133a1fc-d343-4b0b-931d-e570f1cbaad8', supernovaName: 'Text Icon', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'fe99d0fd-f59a-47ef-8743-70ea295953a2', supernovaName: 'Thumbnail', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'f1f88470-b8c0-4963-bba3-346514a99d70', supernovaName: 'Tile', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTile'),
    SupernovaComponentEntry(supernovaId: 'dfe45b70-93e4-4084-86af-13be40891d0a', supernovaName: 'Title', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTitle'),
    SupernovaComponentEntry(supernovaId: '2db4d585-2b1e-4b28-a9a5-4faf0d2406bd', supernovaName: 'Title-Progress', kind: SupernovaComponentKind.widget, flutterWidget: 'YakInputTitleProgress'),
    SupernovaComponentEntry(supernovaId: 'ae8974db-d56d-470c-8154-82ca5074ee5b', supernovaName: 'Toggle', kind: SupernovaComponentKind.widget, flutterWidget: 'YakToggle'),
    SupernovaComponentEntry(supernovaId: 'a6326033-d172-4ebc-9898-bc75092dc8cc', supernovaName: 'Tool tip', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTooltip'),
    SupernovaComponentEntry(supernovaId: '7d84ce69-7956-43f4-8342-b5a29a75a39f', supernovaName: 'top-navigation', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTopNavigation'),
    SupernovaComponentEntry(supernovaId: '1faae90e-47ac-4c51-beee-cb884ff9d629', supernovaName: 'TransferStatus', kind: SupernovaComponentKind.widget, flutterWidget: 'YakTransferStatus'),
    SupernovaComponentEntry(supernovaId: 'f9a97aaa-9609-4f38-8e70-37de4803c7e7', supernovaName: 'User-comment-card', kind: SupernovaComponentKind.widget, flutterWidget: 'YakUserCommentCard'),
    SupernovaComponentEntry(supernovaId: 'f66c050d-c7ab-4ee8-a05f-9be31693aa39', supernovaName: 'Vehicle', kind: SupernovaComponentKind.widget, flutterWidget: 'YakVehicleCard'),
    SupernovaComponentEntry(supernovaId: 'f88a6aa5-8efe-4a9c-aba4-a9f37fa9c409', supernovaName: 'Vehicle', kind: SupernovaComponentKind.widget, flutterWidget: 'YakVehicleCard'),
    SupernovaComponentEntry(supernovaId: 'c0c5407e-48b0-42ad-982e-145ada8df3a0', supernovaName: 'Venn Chart', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: 'f095b0dd-689e-490c-a0f0-6f9f6b820c8b', supernovaName: 'Video Call UI', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '31ea8f93-69fc-41dd-bd7b-052a8935c3dc', supernovaName: 'Video player', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '1fc981fe-3e97-4412-8eb0-38f98ba7e4c7', supernovaName: 'World map', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '0be2750f-4bfa-4204-acb1-9fc14f884f6c', supernovaName: 'YAK-Expression', kind: SupernovaComponentKind.asset),
    SupernovaComponentEntry(supernovaId: '9d1c1837-1d9f-4547-99b1-96fa917b736d', supernovaName: 'YAK-Poses', kind: SupernovaComponentKind.asset),
  ];

  static SupernovaComponentEntry? find(String supernovaName) {
    for (final entry in all) {
      if (entry.supernovaName == supernovaName) return entry;
    }
    return null;
  }

  static SupernovaComponentEntry? findById(String supernovaId) {
    for (final entry in all) {
      if (entry.supernovaId == supernovaId) return entry;
    }
    return null;
  }

  static List<SupernovaComponentEntry> get widgets =>
      all.where((e) => e.kind == SupernovaComponentKind.widget).toList();

  static List<SupernovaComponentEntry> get assets =>
      all.where((e) => e.kind == SupernovaComponentKind.asset).toList();
}
