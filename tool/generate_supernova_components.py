#!/usr/bin/env python3
"""Generate Supernova component registry from tool/supernova_figma_components.csv."""

from __future__ import annotations

import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CSV_PATH = ROOT / "tool" / "supernova_figma_components.csv"
OUT_PATH = ROOT / "lib" / "src" / "components" / "supernova_component_registry.dart"

# Supernova name -> Flutter widget class (null = asset/template only)
WIDGET_MAP: dict[str, str] = {
    "Accordion": "YakAccordion",
    "Action-item": "YakActionItem",
    "Actions": "YakActions",
    "Additional-service": "YakAdditionalService",
    "address-picker": "YakAddressPicker",
    "Alert": "YakAlert",
    "Avatar": "YakAvatar",
    "Avatar & description": "YakAvatarDescription",
    "Avatar group": "YakAvatarGroup",
    "Badge": "YakBadge",
    "Banner": "YakBanner",
    "bottom-navigation": "YakBottomNavigation",
    "BottomSheet": "YakBottomSheet",
    "Breadcrumb": "YakBreadcrumb",
    "Button": "YakButton",
    "Button Close": "YakCloseButton",
    "Button group": "YakButtonGroup",
    "Button Love": "YakLoveButton",
    "Calendar": "YakCalendar",
    "Calendar Dropdown": "YakCalendarDropdown",
    "Card-FinanceSummary": "YakCardFinanceSummary",
    "Card-Message": "YakCardMessage",
    "Card-progress": "YakCardProgress",
    "Card-Transaction": "YakCardTransaction",
    "Card-Transfer": "YakCardTransfer",
    "carousel": "YakCarousel",
    "Chat": "YakChatInput",
    "Chat-Category": "YakChatCategory",
    "Checkbox": "YakCheckbox",
    "Checkbox group": "YakCheckboxGroup",
    "chip": "YakChip",
    "Comment": "YakCommentInput",
    "confirm-delegate": "YakConfirmDelegate",
    "Country": "YakCountrySelect",
    "Credit Banner Balance": "YakCreditBannerBalance",
    "Detail-expand": "YakDetailExpand",
    "Display Date": "YakDisplayDate",
    "Display Icon": "YakDisplayIcon",
    "Divider stepper": "YakDividerStepper",
    "Document Action-item": "YakDocumentActionItem",
    "Document-state": "YakDocumentState",
    "Earning-progress": "YakEarningProgress",
    "Earning-rate": "YakEarningRate",
    "Earning-Type": "YakEarningType",
    "EarningActivityCard": "YakEarningActivityCard",
    "EarningSummary": "YakEarningSummary",
    "Feature-card": "YakFeatureCard",
    "Feature-comment": "YakFeatureComment",
    "Feature-Progress": "YakFeatureProgress",
    "Feature-vote-CTA": "YakFeatureVoteCta",
    "File Upload": "YakFileUpload",
    "filter-chip": "YakFilterChip",
    "FinanceSummary": "YakFinanceSummary",
    "FooterSheet": "YakFooterSheet",
    "Headline": "YakHeadline",
    "hint text": "YakHintText",
    "Icon Button": "YakIconButton",
    "Indicator": "YakInputIndicator",
    "Input field": "YakTextField",
    "Input Text area": "YakTextArea",
    "Input Verification code": "YakVerificationCodeInput",
    "Incentive": "YakIncentive",
    "Job-type": "YakJobType",
    "Label": "YakLabel",
    "location": "YakLocationPicker",
    "Map Pointer": "YakMapPointer",
    "Mobile Segmented Control": "YakSegmentedControl",
    "Modal": "YakModal",
    "Notification": "YakNotification",
    "Notification-Card": "YakNotificationCard",
    "Pagination": "YakPagination",
    "Parcel-type": "YakParcelType",
    "Password indicator": "YakPasswordIndicator",
    "Payment": "YakPaymentMethod",
    "payment-fail": "YakPaymentFail",
    "Payout-expand": "YakPayoutExpand",
    "Payout-state": "YakPayoutState",
    "Phone Number": "YakPhoneNumberField",
    "process": "YakProcessStatus",
    "processCard": "YakProcessCard",
    "Profile-rider": "YakProfileRider",
    "progress": "YakProgress",
    "Progress bar": "YakProgressBar",
    "Progress circle": "YakProgressCircle",
    "Progress semicircle": "YakProgressSemicircle",
    "Rating": "YakRating",
    "Rating-Chip": "YakRatingChip",
    "referral-bonus": "YakReferralBonus",
    "referral-code-card": "YakReferralCodeCard",
    "referral-stepper": "YakReferralStepper",
    "Result-State": "YakResultState",
    "RichtextEditor": "YakRichTextEditor",
    "RichtextToolbar": "YakRichTextToolbar",
    "Rider-type": "YakRiderType",
    "Search": "YakSearchField",
    "Search Action": "YakSearchAction",
    "Search Display": "YakSearchDisplay",
    "Section-Header": "YakSectionHeader",
    "Selector-Group": "YakSelectorGroup",
    "Selects": "YakSelect",
    "Slider": "YakSlider",
    "Social button groups": "YakSocialButtonGroup",
    "Stepper": "YakStepper",
    "Steps": "YakInputSteps",
    "Swipe left action": "YakSwipeAction",
    "Tabs": "YakTabs",
    "Tile": "YakTile",
    "Title": "YakTitle",
    "Title-Progress": "YakInputTitleProgress",
    "Toggle": "YakToggle",
    "Tool tip": "YakTooltip",
    "top-navigation": "YakTopNavigation",
    "TransferStatus": "YakTransferStatus",
    "User-comment-card": "YakUserCommentCard",
    "Vehicle": "YakVehicleCard",
}

ASSET_COMPONENTS = {
    "Bank Logos",
    "Payment Logos",
    "Social platforms logos",
    "Color",
    "Icon",
    "File extensions icon",
    "image",
    "illustration",
    "YAK-Expression",
    "YAK-Poses",
    "logo-app",
    "element",
    "hourglass",
    "ID Card",
    "Component Icon",
    "Freame Icon",
    "Text Icon",
    "Thumbnail",
    "Anatomy Dot",
    "placement",
    "home-indicator",
    "status-bar",
    "Android",
    "iPhone",
    "iOS-push-notifications",
    "MobileScreenTemplate",
    "Modal BG",
    "Chart",
    "Pie Chart",
    "Venn Chart",
    "World map",
    "Video Call UI",
    "Video player",
    "Scroll bar",
}

TEMPLATE_COMPONENTS = {
    ".Card footer",
    ".Card header",
    ".Legend",
    ".Side menu header",
    "7",
    "Component 1",
}


def load_names() -> list[str]:
    names: list[str] = []
    with CSV_PATH.open(newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            names.append(row["name"])
    return names


def generate() -> None:
    names = load_names()
    lines = [
        "// GENERATED — run: python3 tool/generate_supernova_components.py",
        "",
        "/// How a Supernova Figma component is represented in Flutter.",
        "enum SupernovaComponentKind {",
        "  /// Hand-written Flutter widget in this package.",
        "  widget,",
        "",
        "  /// Static asset library (SVG/PNG in assets/).",
        "  asset,",
        "",
        "  /// Figma layout template — compose with other widgets.",
        "  template,",
        "}",
        "",
        "/// Maps a Supernova component name to its Flutter representation.",
        "class SupernovaComponentEntry {",
        "  const SupernovaComponentEntry({",
        "    required this.supernovaName,",
        "    required this.kind,",
        "    this.flutterWidget,",
        "  });",
        "",
        "  final String supernovaName;",
        "  final SupernovaComponentKind kind;",
        "  final String? flutterWidget;",
        "}",
        "",
        "/// All top-level Supernova / Figma components in design system 839081.",
        "abstract final class SupernovaComponentRegistry {",
        "  static const List<SupernovaComponentEntry> all = [",
    ]

    for name in names:
        if name in WIDGET_MAP:
            widget = WIDGET_MAP[name]
            lines.append(
                f"    SupernovaComponentEntry("
                f"supernovaName: {dart_str(name)}, "
                f"kind: SupernovaComponentKind.widget, "
                f"flutterWidget: '{widget}'),"
            )
        elif name in ASSET_COMPONENTS:
            lines.append(
                f"    SupernovaComponentEntry("
                f"supernovaName: {dart_str(name)}, "
                f"kind: SupernovaComponentKind.asset),"
            )
        elif name in TEMPLATE_COMPONENTS:
            lines.append(
                f"    SupernovaComponentEntry("
                f"supernovaName: {dart_str(name)}, "
                f"kind: SupernovaComponentKind.template),"
            )
        else:
            # Unknown — treat as widget placeholder for tracking
            safe = re.sub(r"[^a-zA-Z0-9]", "", name)
            lines.append(
                f"    SupernovaComponentEntry("
                f"supernovaName: {dart_str(name)}, "
                f"kind: SupernovaComponentKind.template),"
            )

    lines.extend(
        [
            "  ];",
            "",
            "  static SupernovaComponentEntry? find(String supernovaName) {",
            "    for (final entry in all) {",
            "      if (entry.supernovaName == supernovaName) return entry;",
            "    }",
            "    return null;",
            "  }",
            "",
            "  static List<SupernovaComponentEntry> get widgets =>",
            "      all.where((e) => e.kind == SupernovaComponentKind.widget).toList();",
            "",
            "  static List<SupernovaComponentEntry> get assets =>",
            "      all.where((e) => e.kind == SupernovaComponentKind.asset).toList();",
            "}",
            "",
        ]
    )

    OUT_PATH.write_text("\n".join(lines), encoding="utf-8")
    widget_count = sum(1 for n in names if n in WIDGET_MAP)
    print(f"Wrote {OUT_PATH} ({len(names)} entries, {widget_count} widgets)")


def dart_str(value: str) -> str:
    return "'" + value.replace("\\", "\\\\").replace("'", "\\'") + "'"


if __name__ == "__main__":
    generate()
