// GENERATED — run: python3 tool/generate_semantic_colors.py
// Source: tool/yak_semantic_color.json (Figma collection "Semantic: Color").

import 'package:flutter/material.dart';

/// YAK semantic color roles with Light and Dark values.
///
/// Read from the active theme via `context.yakColors`.
@immutable
class YakSemanticColors extends ThemeExtension<YakSemanticColors> {
  const YakSemanticColors({
    required this.backgroundBaseDarkMain,
    required this.backgroundBaseDarkOpacity,
    required this.backgroundBaseDarkSecond,
    required this.backgroundBaseMain,
    required this.backgroundBaseOpacity,
    required this.backgroundBaseSecond,
    required this.backgroundBaseThird,
    required this.backgroundBlueMain,
    required this.backgroundBlueSecond,
    required this.backgroundDangerMain,
    required this.backgroundDangerSecond,
    required this.backgroundDisabled,
    required this.backgroundPrimaryMain,
    required this.backgroundPrimarySecond,
    required this.backgroundPurpleMain,
    required this.backgroundPurpleSecond,
    required this.backgroundRedMain,
    required this.backgroundRedSecond,
    required this.backgroundSuccessMain,
    required this.backgroundSuccessSecond,
    required this.backgroundWarningMain,
    required this.backgroundWarningSecond,
    required this.textIconsBaseMain,
    required this.textIconsBaseSecond,
    required this.textIconsBlue,
    required this.textIconsDanger,
    required this.textIconsDisabled,
    required this.textIconsOnDark,
    required this.textIconsOnLight,
    required this.textIconsPrimary,
    required this.textIconsPrimarySecond,
    required this.textIconsPurple,
    required this.textIconsRed,
    required this.textIconsSuccess,
    required this.textIconsWarning,
    required this.strokeBase,
    required this.strokeBaseDark,
    required this.strokeBaseOpacity,
    required this.strokeBlue,
    required this.strokeDanger,
    required this.strokePrimary,
    required this.strokePurple,
    required this.strokeRed,
    required this.strokeSuccess,
    required this.strokeWarning,
    required this.interactionHover,
    required this.interactionSelected,
    required this.overlayScrim,
    required this.serviceDineOutBackgroundAccent,
    required this.serviceDineOutBackgroundAccentSecondary,
    required this.serviceDineOutBackgroundCanvas,
    required this.serviceDineOutBackgroundStrong,
    required this.serviceDineOutBackgroundSubtle,
    required this.serviceDineOutStrokeAccent,
    required this.serviceDineOutStrokeAccentSecondary,
    required this.serviceDineOutStrokeDefault,
    required this.serviceDineOutTextIconsDefault,
    required this.serviceDineOutTextIconsOnAccent,
    required this.serviceDineOutTextIconsSecondary,
    required this.serviceExpressBackgroundAccent,
    required this.serviceExpressBackgroundAccentSecondary,
    required this.serviceExpressBackgroundCanvas,
    required this.serviceExpressBackgroundStrong,
    required this.serviceExpressBackgroundSubtle,
    required this.serviceExpressStrokeAccent,
    required this.serviceExpressStrokeAccentSecondary,
    required this.serviceExpressStrokeDefault,
    required this.serviceExpressTextIconsDefault,
    required this.serviceExpressTextIconsOnAccent,
    required this.serviceExpressTextIconsSecondary,
    required this.serviceFoodBackgroundAccent,
    required this.serviceFoodBackgroundAccentSecondary,
    required this.serviceFoodBackgroundCanvas,
    required this.serviceFoodBackgroundStrong,
    required this.serviceFoodBackgroundSubtle,
    required this.serviceFoodStrokeAccent,
    required this.serviceFoodStrokeAccentSecondary,
    required this.serviceFoodStrokeDefault,
    required this.serviceFoodTextIconsDefault,
    required this.serviceFoodTextIconsOnAccent,
    required this.serviceFoodTextIconsSecondary,
    required this.serviceGiftablesBackgroundAccent,
    required this.serviceGiftablesBackgroundAccentSecondary,
    required this.serviceGiftablesBackgroundCanvas,
    required this.serviceGiftablesBackgroundStrong,
    required this.serviceGiftablesBackgroundSubtle,
    required this.serviceGiftablesStrokeAccent,
    required this.serviceGiftablesStrokeAccentSecondary,
    required this.serviceGiftablesStrokeDefault,
    required this.serviceGiftablesTextIconsDefault,
    required this.serviceGiftablesTextIconsOnAccent,
    required this.serviceGiftablesTextIconsSecondary,
    required this.serviceMartBackgroundAccent,
    required this.serviceMartBackgroundAccentSecondary,
    required this.serviceMartBackgroundCanvas,
    required this.serviceMartBackgroundStrong,
    required this.serviceMartBackgroundSubtle,
    required this.serviceMartStrokeAccent,
    required this.serviceMartStrokeAccentSecondary,
    required this.serviceMartStrokeDefault,
    required this.serviceMartTextIconsDefault,
    required this.serviceMartTextIconsOnAccent,
    required this.serviceMartTextIconsSecondary,
    required this.serviceRideBackgroundAccent,
    required this.serviceRideBackgroundAccentSecondary,
    required this.serviceRideBackgroundCanvas,
    required this.serviceRideBackgroundStrong,
    required this.serviceRideBackgroundSubtle,
    required this.serviceRideStrokeAccent,
    required this.serviceRideStrokeAccentSecondary,
    required this.serviceRideStrokeDefault,
    required this.serviceRideTextIconsDefault,
    required this.serviceRideTextIconsOnAccent,
    required this.serviceRideTextIconsSecondary,
  });

  /// Core/Background/Base-Dark-Main
  ///
  /// Light: Gray/500 · Dark: Gray/500
  final Color backgroundBaseDarkMain;

  /// Core/Background/Base-Dark-Opacity
  ///
  /// Light: Base/Black-Opacity · Dark: Base/Black-Opacity
  final Color backgroundBaseDarkOpacity;

  /// Core/Background/Base-Dark-Second
  ///
  /// Light: Gray/800 · Dark: Gray/800
  final Color backgroundBaseDarkSecond;

  /// Core/Background/Base-Main
  ///
  /// Light: Base/White · Dark: Gray/900
  final Color backgroundBaseMain;

  /// Core/Background/Base-Opacity
  ///
  /// Light: Base/White-Opacity-Secondary · Dark: Base/Black-Opacity
  final Color backgroundBaseOpacity;

  /// Core/Background/Base-Second
  ///
  /// Light: Neutral/50 · Dark: Gray/800
  final Color backgroundBaseSecond;

  /// Core/Background/Base-Third
  ///
  /// Light: Neutral/200 · Dark: Gray/700
  final Color backgroundBaseThird;

  /// Core/Background/Blue-Main
  ///
  /// Light: Blue/500 · Dark: Blue/500
  final Color backgroundBlueMain;

  /// Core/Background/Blue-Second
  ///
  /// Light: Blue/50 · Dark: Blue/900
  final Color backgroundBlueSecond;

  /// Core/Background/Danger-Main
  ///
  /// Light: Red/500 · Dark: Red/500
  final Color backgroundDangerMain;

  /// Core/Background/Danger-Second
  ///
  /// Light: Red/50 · Dark: Red/900
  final Color backgroundDangerSecond;

  /// Core/Background/Disabled
  ///
  /// Light: Neutral/100 · Dark: Gray/800
  final Color backgroundDisabled;

  /// Core/Background/Primary-Main
  ///
  /// Light: Primary/400 · Dark: Primary/400
  final Color backgroundPrimaryMain;

  /// Core/Background/Primary-Second
  ///
  /// Light: Primary/50 · Dark: Primary/900
  final Color backgroundPrimarySecond;

  /// Core/Background/Purple-Main
  ///
  /// Light: Purple/500 · Dark: Purple/500
  final Color backgroundPurpleMain;

  /// Core/Background/Purple-Second
  ///
  /// Light: Purple/50 · Dark: Purple/900
  final Color backgroundPurpleSecond;

  /// Core/Background/Red-Main
  ///
  /// Light: Red/400 · Dark: Red/400
  final Color backgroundRedMain;

  /// Core/Background/Red-Second
  ///
  /// Light: Red/25 · Dark: Red/900
  final Color backgroundRedSecond;

  /// Core/Background/Success-Main
  ///
  /// Light: Green/500 · Dark: Green/500
  final Color backgroundSuccessMain;

  /// Core/Background/Success-Second
  ///
  /// Light: Green/50 · Dark: Green/900
  final Color backgroundSuccessSecond;

  /// Core/Background/Warning-Main
  ///
  /// Light: Warning/500 · Dark: Warning/500
  final Color backgroundWarningMain;

  /// Core/Background/Warning-Second
  ///
  /// Light: Warning/50 · Dark: Warning/900
  final Color backgroundWarningSecond;

  /// Core/Text & Icons/Base-Main
  ///
  /// Light: Gray/500 · Dark: Base/White
  final Color textIconsBaseMain;

  /// Core/Text & Icons/Base-Second
  ///
  /// Light: Neutral/700 · Dark: Gray/100
  final Color textIconsBaseSecond;

  /// Core/Text & Icons/Blue
  ///
  /// Light: Blue/500 · Dark: Blue/300
  final Color textIconsBlue;

  /// Core/Text & Icons/Danger
  ///
  /// Light: Red/500 · Dark: Red/300
  final Color textIconsDanger;

  /// Core/Text & Icons/Disabled
  ///
  /// Light: Neutral/500 · Dark: Gray/400
  final Color textIconsDisabled;

  /// Core/Text & Icons/On-Dark
  ///
  /// Light: Base/White · Dark: Base/White
  ///
  /// Static light content for dark or sufficiently deep colored surfaces. Does not invert between Light and Dark modes.
  final Color textIconsOnDark;

  /// Core/Text & Icons/On-Light
  ///
  /// Light: Gray/900 · Dark: Gray/900
  ///
  /// Static dark content for light or sufficiently bright colored surfaces such as YAK yellow. Does not invert between Light and Dark modes.
  final Color textIconsOnLight;

  /// Core/Text & Icons/Primary
  ///
  /// Light: Primary/600 · Dark: Primary/400
  final Color textIconsPrimary;

  /// Core/Text & Icons/Primary-Second
  ///
  /// Light: Primary/500 · Dark: Primary/500
  final Color textIconsPrimarySecond;

  /// Core/Text & Icons/Purple
  ///
  /// Light: Purple/500 · Dark: Purple/200
  final Color textIconsPurple;

  /// Core/Text & Icons/Red
  ///
  /// Light: Red/400 · Dark: Red/300
  final Color textIconsRed;

  /// Core/Text & Icons/Success
  ///
  /// Light: Green/500 · Dark: Green/400
  final Color textIconsSuccess;

  /// Core/Text & Icons/Warning
  ///
  /// Light: Warning/500 · Dark: Warning/400
  final Color textIconsWarning;

  /// Core/Stroke/Base
  ///
  /// Light: Neutral/200 · Dark: Gray/700
  final Color strokeBase;

  /// Core/Stroke/Base-Dark
  ///
  /// Light: Gray/700 · Dark: Gray/500
  final Color strokeBaseDark;

  /// Core/Stroke/Base-Opacity
  ///
  /// Light: Base/White-Opacity · Dark: Base/White-Opacity-Secondary
  final Color strokeBaseOpacity;

  /// Core/Stroke/Blue
  ///
  /// Light: Blue/600 · Dark: Blue/500
  final Color strokeBlue;

  /// Core/Stroke/Danger
  ///
  /// Light: Red/600 · Dark: Red/600
  final Color strokeDanger;

  /// Core/Stroke/Primary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  final Color strokePrimary;

  /// Core/Stroke/Purple
  ///
  /// Light: Purple/600 · Dark: Purple/500
  final Color strokePurple;

  /// Core/Stroke/Red
  ///
  /// Light: Red/500 · Dark: Red/500
  final Color strokeRed;

  /// Core/Stroke/Success
  ///
  /// Light: Green/600 · Dark: Green/500
  final Color strokeSuccess;

  /// Core/Stroke/Warning
  ///
  /// Light: Warning/600 · Dark: Warning/500
  final Color strokeWarning;

  /// Core/Interaction/Hover
  ///
  /// Light: Neutral/50 · Dark: Gray/800
  ///
  /// Use as the background fill for hover feedback on neutral interactive surfaces. Do not use for selected, focus, disabled, or system feedback states.
  final Color interactionHover;

  /// Core/Interaction/Selected
  ///
  /// Light: Primary/50 · Dark: Primary/900
  ///
  /// Use as the background fill for selected items or active choices. Do not use for error, success, warning, or disabled states.
  final Color interactionSelected;

  /// Core/Overlay/Scrim
  ///
  /// Light: Base/Black-Opacity · Dark: Base/Black-Opacity
  ///
  /// Use behind modal, dialog, drawer, or sheet surfaces to reduce emphasis on underlying content. Do not use as a content surface.
  final Color overlayScrim;

  /// Service/Dine Out/Background/Accent
  ///
  /// Light: Orchid/500 · Dark: Orchid/500
  ///
  /// Dine Out: Primary service accent and selected state. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutBackgroundAccent;

  /// Service/Dine Out/Background/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Dine Out: Shared YAK secondary accent for service campaigns and highlights. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutBackgroundAccentSecondary;

  /// Service/Dine Out/Background/Canvas
  ///
  /// Light: Orchid/700 · Dark: Orchid/800
  ///
  /// Dine Out: Immersive service header or shell canvas. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutBackgroundCanvas;

  /// Service/Dine Out/Background/Strong
  ///
  /// Light: Orchid/900 · Dark: Orchid/700
  ///
  /// Dine Out: High-emphasis service surface. In Dark mode it is brighter than canvas to preserve visual hierarchy. Use only for service identity; keep general content on Core Semantic.
  final Color serviceDineOutBackgroundStrong;

  /// Service/Dine Out/Background/Subtle
  ///
  /// Light: Orchid/50 · Dark: Orchid/900
  ///
  /// Dine Out: Subtle service identity container. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutBackgroundSubtle;

  /// Service/Dine Out/Stroke/Accent
  ///
  /// Light: Orchid/500 · Dark: Orchid/500
  ///
  /// Dine Out: Strong service accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutStrokeAccent;

  /// Service/Dine Out/Stroke/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Dine Out: Secondary YAK accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutStrokeAccentSecondary;

  /// Service/Dine Out/Stroke/Default
  ///
  /// Light: Orchid/200 · Dark: Orchid/700
  ///
  /// Dine Out: Default service identity border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceDineOutStrokeDefault;

  /// Service/Dine Out/Text & Icons/Default
  ///
  /// Light: Orchid/700 · Dark: Orchid/200
  ///
  /// Dine Out: Service identity text and icon on neutral or subtle surfaces. Use Core/Text & Icons for general content.
  final Color serviceDineOutTextIconsDefault;

  /// Service/Dine Out/Text & Icons/On-Accent
  ///
  /// Light: Core/Text & Icons/On-Dark · Dark: Core/Text & Icons/On-Dark
  ///
  /// Dine Out: Accessible text and icon paired with Service/Dine Out/Background/Accent. Resolves through Core/Text & Icons/On-Dark based on contrast.
  final Color serviceDineOutTextIconsOnAccent;

  /// Service/Dine Out/Text & Icons/Secondary
  ///
  /// Light: Orchid/500 · Dark: Orchid/400
  ///
  /// Dine Out: Lower-emphasis service identity color. Use for icons or large/emphasized text; use Default or Core text roles for normal-size readable text.
  final Color serviceDineOutTextIconsSecondary;

  /// Service/Express/Background/Accent
  ///
  /// Light: Tangerine/500 · Dark: Tangerine/500
  ///
  /// Express: Primary service accent and selected state. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressBackgroundAccent;

  /// Service/Express/Background/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Express: Shared YAK secondary accent for service campaigns and highlights. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressBackgroundAccentSecondary;

  /// Service/Express/Background/Canvas
  ///
  /// Light: Tangerine/700 · Dark: Tangerine/800
  ///
  /// Express: Immersive service header or shell canvas. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressBackgroundCanvas;

  /// Service/Express/Background/Strong
  ///
  /// Light: Tangerine/900 · Dark: Tangerine/700
  ///
  /// Express: High-emphasis service surface. In Dark mode it is brighter than canvas to preserve visual hierarchy. Use only for service identity; keep general content on Core Semantic.
  final Color serviceExpressBackgroundStrong;

  /// Service/Express/Background/Subtle
  ///
  /// Light: Tangerine/50 · Dark: Tangerine/900
  ///
  /// Express: Subtle service identity container. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressBackgroundSubtle;

  /// Service/Express/Stroke/Accent
  ///
  /// Light: Tangerine/500 · Dark: Tangerine/500
  ///
  /// Express: Strong service accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressStrokeAccent;

  /// Service/Express/Stroke/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Express: Secondary YAK accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressStrokeAccentSecondary;

  /// Service/Express/Stroke/Default
  ///
  /// Light: Tangerine/200 · Dark: Tangerine/700
  ///
  /// Express: Default service identity border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceExpressStrokeDefault;

  /// Service/Express/Text & Icons/Default
  ///
  /// Light: Tangerine/700 · Dark: Tangerine/200
  ///
  /// Express: Service identity text and icon on neutral or subtle surfaces. Use Core/Text & Icons for general content.
  final Color serviceExpressTextIconsDefault;

  /// Service/Express/Text & Icons/On-Accent
  ///
  /// Light: Core/Text & Icons/On-Light · Dark: Core/Text & Icons/On-Light
  ///
  /// Express: Accessible text and icon paired with Service/Express/Background/Accent. Resolves through Core/Text & Icons/On-Light based on contrast.
  final Color serviceExpressTextIconsOnAccent;

  /// Service/Express/Text & Icons/Secondary
  ///
  /// Light: Tangerine/600 · Dark: Tangerine/400
  ///
  /// Express: Lower-emphasis service identity color. Use for icons or large/emphasized text; use Default or Core text roles for normal-size readable text.
  final Color serviceExpressTextIconsSecondary;

  /// Service/Food/Background/Accent
  ///
  /// Light: Coral/500 · Dark: Coral/500
  ///
  /// Food: Primary service accent and selected state. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodBackgroundAccent;

  /// Service/Food/Background/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Food: Shared YAK secondary accent for service campaigns and highlights. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodBackgroundAccentSecondary;

  /// Service/Food/Background/Canvas
  ///
  /// Light: Coral/700 · Dark: Coral/800
  ///
  /// Food: Immersive service header or shell canvas. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodBackgroundCanvas;

  /// Service/Food/Background/Strong
  ///
  /// Light: Coral/900 · Dark: Coral/700
  ///
  /// Food: High-emphasis service surface. In Dark mode it is brighter than canvas to preserve visual hierarchy. Use only for service identity; keep general content on Core Semantic.
  final Color serviceFoodBackgroundStrong;

  /// Service/Food/Background/Subtle
  ///
  /// Light: Coral/50 · Dark: Coral/900
  ///
  /// Food: Subtle service identity container. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodBackgroundSubtle;

  /// Service/Food/Stroke/Accent
  ///
  /// Light: Coral/500 · Dark: Coral/500
  ///
  /// Food: Strong service accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodStrokeAccent;

  /// Service/Food/Stroke/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Food: Secondary YAK accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodStrokeAccentSecondary;

  /// Service/Food/Stroke/Default
  ///
  /// Light: Coral/200 · Dark: Coral/700
  ///
  /// Food: Default service identity border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceFoodStrokeDefault;

  /// Service/Food/Text & Icons/Default
  ///
  /// Light: Coral/700 · Dark: Coral/200
  ///
  /// Food: Service identity text and icon on neutral or subtle surfaces. Use Core/Text & Icons for general content.
  final Color serviceFoodTextIconsDefault;

  /// Service/Food/Text & Icons/On-Accent
  ///
  /// Light: Core/Text & Icons/On-Light · Dark: Core/Text & Icons/On-Light
  ///
  /// Food: Accessible text and icon paired with Service/Food/Background/Accent. Resolves through Core/Text & Icons/On-Light based on contrast.
  final Color serviceFoodTextIconsOnAccent;

  /// Service/Food/Text & Icons/Secondary
  ///
  /// Light: Coral/500 · Dark: Coral/400
  ///
  /// Food: Lower-emphasis service identity color. Use for icons or large/emphasized text; use Default or Core text roles for normal-size readable text.
  final Color serviceFoodTextIconsSecondary;

  /// Service/Giftables/Background/Accent
  ///
  /// Light: Fuchsia/600 · Dark: Fuchsia/600
  ///
  /// Giftables: Primary service accent and selected state. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesBackgroundAccent;

  /// Service/Giftables/Background/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Giftables: Shared YAK secondary accent for service campaigns and highlights. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesBackgroundAccentSecondary;

  /// Service/Giftables/Background/Canvas
  ///
  /// Light: Fuchsia/700 · Dark: Fuchsia/800
  ///
  /// Giftables: Immersive service header or shell canvas. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesBackgroundCanvas;

  /// Service/Giftables/Background/Strong
  ///
  /// Light: Fuchsia/900 · Dark: Fuchsia/700
  ///
  /// Giftables: High-emphasis service surface. In Dark mode it is brighter than canvas to preserve visual hierarchy. Use only for service identity; keep general content on Core Semantic.
  final Color serviceGiftablesBackgroundStrong;

  /// Service/Giftables/Background/Subtle
  ///
  /// Light: Fuchsia/50 · Dark: Fuchsia/900
  ///
  /// Giftables: Subtle service identity container. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesBackgroundSubtle;

  /// Service/Giftables/Stroke/Accent
  ///
  /// Light: Fuchsia/600 · Dark: Fuchsia/600
  ///
  /// Giftables: Strong service accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesStrokeAccent;

  /// Service/Giftables/Stroke/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Giftables: Secondary YAK accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesStrokeAccentSecondary;

  /// Service/Giftables/Stroke/Default
  ///
  /// Light: Fuchsia/200 · Dark: Fuchsia/700
  ///
  /// Giftables: Default service identity border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceGiftablesStrokeDefault;

  /// Service/Giftables/Text & Icons/Default
  ///
  /// Light: Fuchsia/700 · Dark: Fuchsia/200
  ///
  /// Giftables: Service identity text and icon on neutral or subtle surfaces. Use Core/Text & Icons for general content.
  final Color serviceGiftablesTextIconsDefault;

  /// Service/Giftables/Text & Icons/On-Accent
  ///
  /// Light: Core/Text & Icons/On-Dark · Dark: Core/Text & Icons/On-Dark
  ///
  /// Giftables: Accessible text and icon paired with Service/Giftables/Background/Accent. Resolves through Core/Text & Icons/On-Dark based on contrast.
  final Color serviceGiftablesTextIconsOnAccent;

  /// Service/Giftables/Text & Icons/Secondary
  ///
  /// Light: Fuchsia/500 · Dark: Fuchsia/400
  ///
  /// Giftables: Lower-emphasis service identity color. Use for icons or large/emphasized text; use Default or Core text roles for normal-size readable text.
  final Color serviceGiftablesTextIconsSecondary;

  /// Service/Mart/Background/Accent
  ///
  /// Light: Jade/600 · Dark: Jade/600
  ///
  /// Mart: Primary service accent and selected state. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartBackgroundAccent;

  /// Service/Mart/Background/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Mart: Shared YAK secondary accent for service campaigns and highlights. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartBackgroundAccentSecondary;

  /// Service/Mart/Background/Canvas
  ///
  /// Light: Jade/700 · Dark: Jade/800
  ///
  /// Mart: Immersive service header or shell canvas. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartBackgroundCanvas;

  /// Service/Mart/Background/Strong
  ///
  /// Light: Jade/900 · Dark: Jade/700
  ///
  /// Mart: High-emphasis service surface. In Dark mode it is brighter than canvas to preserve visual hierarchy. Use only for service identity; keep general content on Core Semantic.
  final Color serviceMartBackgroundStrong;

  /// Service/Mart/Background/Subtle
  ///
  /// Light: Jade/50 · Dark: Jade/900
  ///
  /// Mart: Subtle service identity container. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartBackgroundSubtle;

  /// Service/Mart/Stroke/Accent
  ///
  /// Light: Jade/600 · Dark: Jade/600
  ///
  /// Mart: Strong service accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartStrokeAccent;

  /// Service/Mart/Stroke/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Mart: Secondary YAK accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartStrokeAccentSecondary;

  /// Service/Mart/Stroke/Default
  ///
  /// Light: Jade/200 · Dark: Jade/700
  ///
  /// Mart: Default service identity border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceMartStrokeDefault;

  /// Service/Mart/Text & Icons/Default
  ///
  /// Light: Jade/700 · Dark: Jade/200
  ///
  /// Mart: Service identity text and icon on neutral or subtle surfaces. Use Core/Text & Icons for general content.
  final Color serviceMartTextIconsDefault;

  /// Service/Mart/Text & Icons/On-Accent
  ///
  /// Light: Core/Text & Icons/On-Dark · Dark: Core/Text & Icons/On-Dark
  ///
  /// Mart: Accessible text and icon paired with Service/Mart/Background/Accent. Resolves through Core/Text & Icons/On-Dark based on contrast.
  final Color serviceMartTextIconsOnAccent;

  /// Service/Mart/Text & Icons/Secondary
  ///
  /// Light: Jade/500 · Dark: Jade/400
  ///
  /// Mart: Lower-emphasis service identity color. Use for icons or large/emphasized text; use Default or Core text roles for normal-size readable text.
  final Color serviceMartTextIconsSecondary;

  /// Service/Ride/Background/Accent
  ///
  /// Light: Cobalt/500 · Dark: Cobalt/500
  ///
  /// Ride: Primary service accent and selected state. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideBackgroundAccent;

  /// Service/Ride/Background/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Ride: Shared YAK secondary accent for service campaigns and highlights. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideBackgroundAccentSecondary;

  /// Service/Ride/Background/Canvas
  ///
  /// Light: Cobalt/700 · Dark: Cobalt/800
  ///
  /// Ride: Immersive service header or shell canvas. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideBackgroundCanvas;

  /// Service/Ride/Background/Strong
  ///
  /// Light: Cobalt/900 · Dark: Cobalt/700
  ///
  /// Ride: High-emphasis service surface. In Dark mode it is brighter than canvas to preserve visual hierarchy. Use only for service identity; keep general content on Core Semantic.
  final Color serviceRideBackgroundStrong;

  /// Service/Ride/Background/Subtle
  ///
  /// Light: Cobalt/50 · Dark: Cobalt/900
  ///
  /// Ride: Subtle service identity container. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideBackgroundSubtle;

  /// Service/Ride/Stroke/Accent
  ///
  /// Light: Cobalt/500 · Dark: Cobalt/500
  ///
  /// Ride: Strong service accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideStrokeAccent;

  /// Service/Ride/Stroke/Accent-Secondary
  ///
  /// Light: Primary/500 · Dark: Primary/500
  ///
  /// Ride: Secondary YAK accent border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideStrokeAccentSecondary;

  /// Service/Ride/Stroke/Default
  ///
  /// Light: Cobalt/200 · Dark: Cobalt/700
  ///
  /// Ride: Default service identity border. Use only to express service identity/theme; keep general content on Core Semantic.
  final Color serviceRideStrokeDefault;

  /// Service/Ride/Text & Icons/Default
  ///
  /// Light: Cobalt/700 · Dark: Cobalt/200
  ///
  /// Ride: Service identity text and icon on neutral or subtle surfaces. Use Core/Text & Icons for general content.
  final Color serviceRideTextIconsDefault;

  /// Service/Ride/Text & Icons/On-Accent
  ///
  /// Light: Core/Text & Icons/On-Dark · Dark: Core/Text & Icons/On-Dark
  ///
  /// Ride: Accessible text and icon paired with Service/Ride/Background/Accent. Resolves through Core/Text & Icons/On-Dark based on contrast.
  final Color serviceRideTextIconsOnAccent;

  /// Service/Ride/Text & Icons/Secondary
  ///
  /// Light: Cobalt/500 · Dark: Cobalt/400
  ///
  /// Ride: Lower-emphasis service identity color. Use for icons or large/emphasized text; use Default or Core text roles for normal-size readable text.
  final Color serviceRideTextIconsSecondary;

  static const light = YakSemanticColors(
    backgroundBaseDarkMain: Color(0xFF353841),
    backgroundBaseDarkOpacity: Color(0x66000000),
    backgroundBaseDarkSecond: Color(0xFF1D1F24),
    backgroundBaseMain: Color(0xFFFFFFFF),
    backgroundBaseOpacity: Color(0x33FFFFFF),
    backgroundBaseSecond: Color(0xFFF9F9F9),
    backgroundBaseThird: Color(0xFFE5E5E5),
    backgroundBlueMain: Color(0xFF008DFF),
    backgroundBlueSecond: Color(0xFFE6F4FF),
    backgroundDangerMain: Color(0xFFFF4538),
    backgroundDangerSecond: Color(0xFFFFECEB),
    backgroundDisabled: Color(0xFFEEEEEE),
    backgroundPrimaryMain: Color(0xFFFFDA47),
    backgroundPrimarySecond: Color(0xFFFFFAE8),
    backgroundPurpleMain: Color(0xFF5D55F6),
    backgroundPurpleSecond: Color(0xFFECEBFF),
    backgroundRedMain: Color(0xFFFF6A60),
    backgroundRedSecond: Color(0xFFFFF7F6),
    backgroundSuccessMain: Color(0xFF3AD88E),
    backgroundSuccessSecond: Color(0xFFEBFBF4),
    backgroundWarningMain: Color(0xFFF99D0E),
    backgroundWarningSecond: Color(0xFFFEF5E7),
    textIconsBaseMain: Color(0xFF353841),
    textIconsBaseSecond: Color(0xFF8D8D8D),
    textIconsBlue: Color(0xFF008DFF),
    textIconsDanger: Color(0xFFFF4538),
    textIconsDisabled: Color(0xFFC7C7C7),
    textIconsOnDark: Color(0xFFFFFFFF),
    textIconsOnLight: Color(0xFF16181B),
    textIconsPrimary: Color(0xFFE8BE17),
    textIconsPrimarySecond: Color(0xFFFFD119),
    textIconsPurple: Color(0xFF5D55F6),
    textIconsRed: Color(0xFFFF6A60),
    textIconsSuccess: Color(0xFF3AD88E),
    textIconsWarning: Color(0xFFF99D0E),
    strokeBase: Color(0xFFE5E5E5),
    strokeBaseDark: Color(0xFF26282E),
    strokeBaseOpacity: Color(0x66FFFFFF),
    strokeBlue: Color(0xFF0080E8),
    strokeDanger: Color(0xFFE83F33),
    strokePrimary: Color(0xFFFFD119),
    strokePurple: Color(0xFF574EFA),
    strokeRed: Color(0xFFFF4538),
    strokeSuccess: Color(0xFF35C581),
    strokeWarning: Color(0xFFE38F0D),
    interactionHover: Color(0xFFF9F9F9),
    interactionSelected: Color(0xFFFFFAE8),
    overlayScrim: Color(0x66000000),
    serviceDineOutBackgroundAccent: Color(0xFF873EAD),
    serviceDineOutBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceDineOutBackgroundCanvas: Color(0xFF602C7B),
    serviceDineOutBackgroundStrong: Color(0xFF391A49),
    serviceDineOutBackgroundSubtle: Color(0xFFF3ECF7),
    serviceDineOutStrokeAccent: Color(0xFF873EAD),
    serviceDineOutStrokeAccentSecondary: Color(0xFFFFD119),
    serviceDineOutStrokeDefault: Color(0xFFC8A6D9),
    serviceDineOutTextIconsDefault: Color(0xFF602C7B),
    serviceDineOutTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceDineOutTextIconsSecondary: Color(0xFF873EAD),
    serviceExpressBackgroundAccent: Color(0xFFEC7627),
    serviceExpressBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceExpressBackgroundCanvas: Color(0xFFA8541C),
    serviceExpressBackgroundStrong: Color(0xFF633210),
    serviceExpressBackgroundSubtle: Color(0xFFFDF1E9),
    serviceExpressStrokeAccent: Color(0xFFEC7627),
    serviceExpressStrokeAccentSecondary: Color(0xFFFFD119),
    serviceExpressStrokeDefault: Color(0xFFF6C09C),
    serviceExpressTextIconsDefault: Color(0xFFA8541C),
    serviceExpressTextIconsOnAccent: Color(0xFF16181B),
    serviceExpressTextIconsSecondary: Color(0xFFD76B23),
    serviceFoodBackgroundAccent: Color(0xFFF05C54),
    serviceFoodBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceFoodBackgroundCanvas: Color(0xFFAA413C),
    serviceFoodBackgroundStrong: Color(0xFF652723),
    serviceFoodBackgroundSubtle: Color(0xFFFEEFEE),
    serviceFoodStrokeAccent: Color(0xFFF05C54),
    serviceFoodStrokeAccentSecondary: Color(0xFFFFD119),
    serviceFoodStrokeDefault: Color(0xFFF8B4B0),
    serviceFoodTextIconsDefault: Color(0xFFAA413C),
    serviceFoodTextIconsOnAccent: Color(0xFF16181B),
    serviceFoodTextIconsSecondary: Color(0xFFF05C54),
    serviceGiftablesBackgroundAccent: Color(0xFFC43C80),
    serviceGiftablesBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceGiftablesBackgroundCanvas: Color(0xFF992F64),
    serviceGiftablesBackgroundStrong: Color(0xFF5A1C3B),
    serviceGiftablesBackgroundSubtle: Color(0xFFFBECF4),
    serviceGiftablesStrokeAccent: Color(0xFFC43C80),
    serviceGiftablesStrokeAccentSecondary: Color(0xFFFFD119),
    serviceGiftablesStrokeDefault: Color(0xFFEDA8CB),
    serviceGiftablesTextIconsDefault: Color(0xFF992F64),
    serviceGiftablesTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceGiftablesTextIconsSecondary: Color(0xFFD7428D),
    serviceMartBackgroundAccent: Color(0xFF148168),
    serviceMartBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceMartBackgroundCanvas: Color(0xFF106551),
    serviceMartBackgroundStrong: Color(0xFF093C30),
    serviceMartBackgroundSubtle: Color(0xFFE8F4F1),
    serviceMartStrokeAccent: Color(0xFF148168),
    serviceMartStrokeAccentSecondary: Color(0xFFFFD119),
    serviceMartStrokeDefault: Color(0xFF94CBBE),
    serviceMartTextIconsDefault: Color(0xFF106551),
    serviceMartTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceMartTextIconsSecondary: Color(0xFF168E72),
    serviceRideBackgroundAccent: Color(0xFF315BCB),
    serviceRideBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceRideBackgroundCanvas: Color(0xFF234190),
    serviceRideBackgroundStrong: Color(0xFF152655),
    serviceRideBackgroundSubtle: Color(0xFFEAEFFA),
    serviceRideStrokeAccent: Color(0xFF315BCB),
    serviceRideStrokeAccentSecondary: Color(0xFFFFD119),
    serviceRideStrokeDefault: Color(0xFFA0B4E7),
    serviceRideTextIconsDefault: Color(0xFF234190),
    serviceRideTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceRideTextIconsSecondary: Color(0xFF315BCB),
  );

  static const dark = YakSemanticColors(
    backgroundBaseDarkMain: Color(0xFF353841),
    backgroundBaseDarkOpacity: Color(0x66000000),
    backgroundBaseDarkSecond: Color(0xFF1D1F24),
    backgroundBaseMain: Color(0xFF16181B),
    backgroundBaseOpacity: Color(0x66000000),
    backgroundBaseSecond: Color(0xFF1D1F24),
    backgroundBaseThird: Color(0xFF26282E),
    backgroundBlueMain: Color(0xFF008DFF),
    backgroundBlueSecond: Color(0xFF003B6B),
    backgroundDangerMain: Color(0xFFFF4538),
    backgroundDangerSecond: Color(0xFF6B1D18),
    backgroundDisabled: Color(0xFF1D1F24),
    backgroundPrimaryMain: Color(0xFFFFDA47),
    backgroundPrimarySecond: Color(0xFF6B580B),
    backgroundPurpleMain: Color(0xFF5D55F6),
    backgroundPurpleSecond: Color(0xFF33059F),
    backgroundRedMain: Color(0xFFFF6A60),
    backgroundRedSecond: Color(0xFF6B1D18),
    backgroundSuccessMain: Color(0xFF3AD88E),
    backgroundSuccessSecond: Color(0xFF185B3C),
    backgroundWarningMain: Color(0xFFF99D0E),
    backgroundWarningSecond: Color(0xFF694206),
    textIconsBaseMain: Color(0xFFFFFFFF),
    textIconsBaseSecond: Color(0xFFC0C1C4),
    textIconsBlue: Color(0xFF54B3FF),
    textIconsDanger: Color(0xFFFF827A),
    textIconsDisabled: Color(0xFF5D6067),
    textIconsOnDark: Color(0xFFFFFFFF),
    textIconsOnLight: Color(0xFF16181B),
    textIconsPrimary: Color(0xFFFFDA47),
    textIconsPrimarySecond: Color(0xFFFFD119),
    textIconsPurple: Color(0xFFABA7FD),
    textIconsRed: Color(0xFFFF827A),
    textIconsSuccess: Color(0xFF61E0A5),
    textIconsWarning: Color(0xFFFAB13E),
    strokeBase: Color(0xFF26282E),
    strokeBaseDark: Color(0xFF353841),
    strokeBaseOpacity: Color(0x33FFFFFF),
    strokeBlue: Color(0xFF008DFF),
    strokeDanger: Color(0xFFE83F33),
    strokePrimary: Color(0xFFFFD119),
    strokePurple: Color(0xFF5D55F6),
    strokeRed: Color(0xFFFF4538),
    strokeSuccess: Color(0xFF3AD88E),
    strokeWarning: Color(0xFFF99D0E),
    interactionHover: Color(0xFF1D1F24),
    interactionSelected: Color(0xFF6B580B),
    overlayScrim: Color(0x66000000),
    serviceDineOutBackgroundAccent: Color(0xFF873EAD),
    serviceDineOutBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceDineOutBackgroundCanvas: Color(0xFF4A225F),
    serviceDineOutBackgroundStrong: Color(0xFF602C7B),
    serviceDineOutBackgroundSubtle: Color(0xFF391A49),
    serviceDineOutStrokeAccent: Color(0xFF873EAD),
    serviceDineOutStrokeAccentSecondary: Color(0xFFFFD119),
    serviceDineOutStrokeDefault: Color(0xFF602C7B),
    serviceDineOutTextIconsDefault: Color(0xFFC8A6D9),
    serviceDineOutTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceDineOutTextIconsSecondary: Color(0xFF9F65BD),
    serviceExpressBackgroundAccent: Color(0xFFEC7627),
    serviceExpressBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceExpressBackgroundCanvas: Color(0xFF824115),
    serviceExpressBackgroundStrong: Color(0xFFA8541C),
    serviceExpressBackgroundSubtle: Color(0xFF633210),
    serviceExpressStrokeAccent: Color(0xFFEC7627),
    serviceExpressStrokeAccentSecondary: Color(0xFFFFD119),
    serviceExpressStrokeDefault: Color(0xFFA8541C),
    serviceExpressTextIconsDefault: Color(0xFFF6C09C),
    serviceExpressTextIconsOnAccent: Color(0xFF16181B),
    serviceExpressTextIconsSecondary: Color(0xFFF09152),
    serviceFoodBackgroundAccent: Color(0xFFF05C54),
    serviceFoodBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceFoodBackgroundCanvas: Color(0xFF84332E),
    serviceFoodBackgroundStrong: Color(0xFFAA413C),
    serviceFoodBackgroundSubtle: Color(0xFF652723),
    serviceFoodStrokeAccent: Color(0xFFF05C54),
    serviceFoodStrokeAccentSecondary: Color(0xFFFFD119),
    serviceFoodStrokeDefault: Color(0xFFAA413C),
    serviceFoodTextIconsDefault: Color(0xFFF8B4B0),
    serviceFoodTextIconsOnAccent: Color(0xFF16181B),
    serviceFoodTextIconsSecondary: Color(0xFFF37D76),
    serviceGiftablesBackgroundAccent: Color(0xFFC43C80),
    serviceGiftablesBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceGiftablesBackgroundCanvas: Color(0xFF76244E),
    serviceGiftablesBackgroundStrong: Color(0xFF992F64),
    serviceGiftablesBackgroundSubtle: Color(0xFF5A1C3B),
    serviceGiftablesStrokeAccent: Color(0xFFC43C80),
    serviceGiftablesStrokeAccentSecondary: Color(0xFFFFD119),
    serviceGiftablesStrokeDefault: Color(0xFF992F64),
    serviceGiftablesTextIconsDefault: Color(0xFFEDA8CB),
    serviceGiftablesTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceGiftablesTextIconsSecondary: Color(0xFFDF68A4),
    serviceMartBackgroundAccent: Color(0xFF148168),
    serviceMartBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceMartBackgroundCanvas: Color(0xFF0C4E3F),
    serviceMartBackgroundStrong: Color(0xFF106551),
    serviceMartBackgroundSubtle: Color(0xFF093C30),
    serviceMartStrokeAccent: Color(0xFF148168),
    serviceMartStrokeAccentSecondary: Color(0xFFFFD119),
    serviceMartStrokeDefault: Color(0xFF106551),
    serviceMartTextIconsDefault: Color(0xFF94CBBE),
    serviceMartTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceMartTextIconsSecondary: Color(0xFF45A58E),
    serviceRideBackgroundAccent: Color(0xFF315BCB),
    serviceRideBackgroundAccentSecondary: Color(0xFFFFD119),
    serviceRideBackgroundCanvas: Color(0xFF1B3270),
    serviceRideBackgroundStrong: Color(0xFF234190),
    serviceRideBackgroundSubtle: Color(0xFF152655),
    serviceRideStrokeAccent: Color(0xFF315BCB),
    serviceRideStrokeAccentSecondary: Color(0xFFFFD119),
    serviceRideStrokeDefault: Color(0xFF234190),
    serviceRideTextIconsDefault: Color(0xFFA0B4E7),
    serviceRideTextIconsOnAccent: Color(0xFFFFFFFF),
    serviceRideTextIconsSecondary: Color(0xFF5A7CD5),
  );

  /// Figma variable path → resolved color, in Figma collection order.
  Map<String, Color> toMap() => {
    'Core/Background/Base-Dark-Main': backgroundBaseDarkMain,
    'Core/Background/Base-Dark-Opacity': backgroundBaseDarkOpacity,
    'Core/Background/Base-Dark-Second': backgroundBaseDarkSecond,
    'Core/Background/Base-Main': backgroundBaseMain,
    'Core/Background/Base-Opacity': backgroundBaseOpacity,
    'Core/Background/Base-Second': backgroundBaseSecond,
    'Core/Background/Base-Third': backgroundBaseThird,
    'Core/Background/Blue-Main': backgroundBlueMain,
    'Core/Background/Blue-Second': backgroundBlueSecond,
    'Core/Background/Danger-Main': backgroundDangerMain,
    'Core/Background/Danger-Second': backgroundDangerSecond,
    'Core/Background/Disabled': backgroundDisabled,
    'Core/Background/Primary-Main': backgroundPrimaryMain,
    'Core/Background/Primary-Second': backgroundPrimarySecond,
    'Core/Background/Purple-Main': backgroundPurpleMain,
    'Core/Background/Purple-Second': backgroundPurpleSecond,
    'Core/Background/Red-Main': backgroundRedMain,
    'Core/Background/Red-Second': backgroundRedSecond,
    'Core/Background/Success-Main': backgroundSuccessMain,
    'Core/Background/Success-Second': backgroundSuccessSecond,
    'Core/Background/Warning-Main': backgroundWarningMain,
    'Core/Background/Warning-Second': backgroundWarningSecond,
    'Core/Text & Icons/Base-Main': textIconsBaseMain,
    'Core/Text & Icons/Base-Second': textIconsBaseSecond,
    'Core/Text & Icons/Blue': textIconsBlue,
    'Core/Text & Icons/Danger': textIconsDanger,
    'Core/Text & Icons/Disabled': textIconsDisabled,
    'Core/Text & Icons/On-Dark': textIconsOnDark,
    'Core/Text & Icons/On-Light': textIconsOnLight,
    'Core/Text & Icons/Primary': textIconsPrimary,
    'Core/Text & Icons/Primary-Second': textIconsPrimarySecond,
    'Core/Text & Icons/Purple': textIconsPurple,
    'Core/Text & Icons/Red': textIconsRed,
    'Core/Text & Icons/Success': textIconsSuccess,
    'Core/Text & Icons/Warning': textIconsWarning,
    'Core/Stroke/Base': strokeBase,
    'Core/Stroke/Base-Dark': strokeBaseDark,
    'Core/Stroke/Base-Opacity': strokeBaseOpacity,
    'Core/Stroke/Blue': strokeBlue,
    'Core/Stroke/Danger': strokeDanger,
    'Core/Stroke/Primary': strokePrimary,
    'Core/Stroke/Purple': strokePurple,
    'Core/Stroke/Red': strokeRed,
    'Core/Stroke/Success': strokeSuccess,
    'Core/Stroke/Warning': strokeWarning,
    'Core/Interaction/Hover': interactionHover,
    'Core/Interaction/Selected': interactionSelected,
    'Core/Overlay/Scrim': overlayScrim,
    'Service/Dine Out/Background/Accent': serviceDineOutBackgroundAccent,
    'Service/Dine Out/Background/Accent-Secondary':
        serviceDineOutBackgroundAccentSecondary,
    'Service/Dine Out/Background/Canvas': serviceDineOutBackgroundCanvas,
    'Service/Dine Out/Background/Strong': serviceDineOutBackgroundStrong,
    'Service/Dine Out/Background/Subtle': serviceDineOutBackgroundSubtle,
    'Service/Dine Out/Stroke/Accent': serviceDineOutStrokeAccent,
    'Service/Dine Out/Stroke/Accent-Secondary':
        serviceDineOutStrokeAccentSecondary,
    'Service/Dine Out/Stroke/Default': serviceDineOutStrokeDefault,
    'Service/Dine Out/Text & Icons/Default': serviceDineOutTextIconsDefault,
    'Service/Dine Out/Text & Icons/On-Accent': serviceDineOutTextIconsOnAccent,
    'Service/Dine Out/Text & Icons/Secondary': serviceDineOutTextIconsSecondary,
    'Service/Express/Background/Accent': serviceExpressBackgroundAccent,
    'Service/Express/Background/Accent-Secondary':
        serviceExpressBackgroundAccentSecondary,
    'Service/Express/Background/Canvas': serviceExpressBackgroundCanvas,
    'Service/Express/Background/Strong': serviceExpressBackgroundStrong,
    'Service/Express/Background/Subtle': serviceExpressBackgroundSubtle,
    'Service/Express/Stroke/Accent': serviceExpressStrokeAccent,
    'Service/Express/Stroke/Accent-Secondary':
        serviceExpressStrokeAccentSecondary,
    'Service/Express/Stroke/Default': serviceExpressStrokeDefault,
    'Service/Express/Text & Icons/Default': serviceExpressTextIconsDefault,
    'Service/Express/Text & Icons/On-Accent': serviceExpressTextIconsOnAccent,
    'Service/Express/Text & Icons/Secondary': serviceExpressTextIconsSecondary,
    'Service/Food/Background/Accent': serviceFoodBackgroundAccent,
    'Service/Food/Background/Accent-Secondary':
        serviceFoodBackgroundAccentSecondary,
    'Service/Food/Background/Canvas': serviceFoodBackgroundCanvas,
    'Service/Food/Background/Strong': serviceFoodBackgroundStrong,
    'Service/Food/Background/Subtle': serviceFoodBackgroundSubtle,
    'Service/Food/Stroke/Accent': serviceFoodStrokeAccent,
    'Service/Food/Stroke/Accent-Secondary': serviceFoodStrokeAccentSecondary,
    'Service/Food/Stroke/Default': serviceFoodStrokeDefault,
    'Service/Food/Text & Icons/Default': serviceFoodTextIconsDefault,
    'Service/Food/Text & Icons/On-Accent': serviceFoodTextIconsOnAccent,
    'Service/Food/Text & Icons/Secondary': serviceFoodTextIconsSecondary,
    'Service/Giftables/Background/Accent': serviceGiftablesBackgroundAccent,
    'Service/Giftables/Background/Accent-Secondary':
        serviceGiftablesBackgroundAccentSecondary,
    'Service/Giftables/Background/Canvas': serviceGiftablesBackgroundCanvas,
    'Service/Giftables/Background/Strong': serviceGiftablesBackgroundStrong,
    'Service/Giftables/Background/Subtle': serviceGiftablesBackgroundSubtle,
    'Service/Giftables/Stroke/Accent': serviceGiftablesStrokeAccent,
    'Service/Giftables/Stroke/Accent-Secondary':
        serviceGiftablesStrokeAccentSecondary,
    'Service/Giftables/Stroke/Default': serviceGiftablesStrokeDefault,
    'Service/Giftables/Text & Icons/Default': serviceGiftablesTextIconsDefault,
    'Service/Giftables/Text & Icons/On-Accent':
        serviceGiftablesTextIconsOnAccent,
    'Service/Giftables/Text & Icons/Secondary':
        serviceGiftablesTextIconsSecondary,
    'Service/Mart/Background/Accent': serviceMartBackgroundAccent,
    'Service/Mart/Background/Accent-Secondary':
        serviceMartBackgroundAccentSecondary,
    'Service/Mart/Background/Canvas': serviceMartBackgroundCanvas,
    'Service/Mart/Background/Strong': serviceMartBackgroundStrong,
    'Service/Mart/Background/Subtle': serviceMartBackgroundSubtle,
    'Service/Mart/Stroke/Accent': serviceMartStrokeAccent,
    'Service/Mart/Stroke/Accent-Secondary': serviceMartStrokeAccentSecondary,
    'Service/Mart/Stroke/Default': serviceMartStrokeDefault,
    'Service/Mart/Text & Icons/Default': serviceMartTextIconsDefault,
    'Service/Mart/Text & Icons/On-Accent': serviceMartTextIconsOnAccent,
    'Service/Mart/Text & Icons/Secondary': serviceMartTextIconsSecondary,
    'Service/Ride/Background/Accent': serviceRideBackgroundAccent,
    'Service/Ride/Background/Accent-Secondary':
        serviceRideBackgroundAccentSecondary,
    'Service/Ride/Background/Canvas': serviceRideBackgroundCanvas,
    'Service/Ride/Background/Strong': serviceRideBackgroundStrong,
    'Service/Ride/Background/Subtle': serviceRideBackgroundSubtle,
    'Service/Ride/Stroke/Accent': serviceRideStrokeAccent,
    'Service/Ride/Stroke/Accent-Secondary': serviceRideStrokeAccentSecondary,
    'Service/Ride/Stroke/Default': serviceRideStrokeDefault,
    'Service/Ride/Text & Icons/Default': serviceRideTextIconsDefault,
    'Service/Ride/Text & Icons/On-Accent': serviceRideTextIconsOnAccent,
    'Service/Ride/Text & Icons/Secondary': serviceRideTextIconsSecondary,
  };

  @override
  YakSemanticColors copyWith({
    Color? backgroundBaseDarkMain,
    Color? backgroundBaseDarkOpacity,
    Color? backgroundBaseDarkSecond,
    Color? backgroundBaseMain,
    Color? backgroundBaseOpacity,
    Color? backgroundBaseSecond,
    Color? backgroundBaseThird,
    Color? backgroundBlueMain,
    Color? backgroundBlueSecond,
    Color? backgroundDangerMain,
    Color? backgroundDangerSecond,
    Color? backgroundDisabled,
    Color? backgroundPrimaryMain,
    Color? backgroundPrimarySecond,
    Color? backgroundPurpleMain,
    Color? backgroundPurpleSecond,
    Color? backgroundRedMain,
    Color? backgroundRedSecond,
    Color? backgroundSuccessMain,
    Color? backgroundSuccessSecond,
    Color? backgroundWarningMain,
    Color? backgroundWarningSecond,
    Color? textIconsBaseMain,
    Color? textIconsBaseSecond,
    Color? textIconsBlue,
    Color? textIconsDanger,
    Color? textIconsDisabled,
    Color? textIconsOnDark,
    Color? textIconsOnLight,
    Color? textIconsPrimary,
    Color? textIconsPrimarySecond,
    Color? textIconsPurple,
    Color? textIconsRed,
    Color? textIconsSuccess,
    Color? textIconsWarning,
    Color? strokeBase,
    Color? strokeBaseDark,
    Color? strokeBaseOpacity,
    Color? strokeBlue,
    Color? strokeDanger,
    Color? strokePrimary,
    Color? strokePurple,
    Color? strokeRed,
    Color? strokeSuccess,
    Color? strokeWarning,
    Color? interactionHover,
    Color? interactionSelected,
    Color? overlayScrim,
    Color? serviceDineOutBackgroundAccent,
    Color? serviceDineOutBackgroundAccentSecondary,
    Color? serviceDineOutBackgroundCanvas,
    Color? serviceDineOutBackgroundStrong,
    Color? serviceDineOutBackgroundSubtle,
    Color? serviceDineOutStrokeAccent,
    Color? serviceDineOutStrokeAccentSecondary,
    Color? serviceDineOutStrokeDefault,
    Color? serviceDineOutTextIconsDefault,
    Color? serviceDineOutTextIconsOnAccent,
    Color? serviceDineOutTextIconsSecondary,
    Color? serviceExpressBackgroundAccent,
    Color? serviceExpressBackgroundAccentSecondary,
    Color? serviceExpressBackgroundCanvas,
    Color? serviceExpressBackgroundStrong,
    Color? serviceExpressBackgroundSubtle,
    Color? serviceExpressStrokeAccent,
    Color? serviceExpressStrokeAccentSecondary,
    Color? serviceExpressStrokeDefault,
    Color? serviceExpressTextIconsDefault,
    Color? serviceExpressTextIconsOnAccent,
    Color? serviceExpressTextIconsSecondary,
    Color? serviceFoodBackgroundAccent,
    Color? serviceFoodBackgroundAccentSecondary,
    Color? serviceFoodBackgroundCanvas,
    Color? serviceFoodBackgroundStrong,
    Color? serviceFoodBackgroundSubtle,
    Color? serviceFoodStrokeAccent,
    Color? serviceFoodStrokeAccentSecondary,
    Color? serviceFoodStrokeDefault,
    Color? serviceFoodTextIconsDefault,
    Color? serviceFoodTextIconsOnAccent,
    Color? serviceFoodTextIconsSecondary,
    Color? serviceGiftablesBackgroundAccent,
    Color? serviceGiftablesBackgroundAccentSecondary,
    Color? serviceGiftablesBackgroundCanvas,
    Color? serviceGiftablesBackgroundStrong,
    Color? serviceGiftablesBackgroundSubtle,
    Color? serviceGiftablesStrokeAccent,
    Color? serviceGiftablesStrokeAccentSecondary,
    Color? serviceGiftablesStrokeDefault,
    Color? serviceGiftablesTextIconsDefault,
    Color? serviceGiftablesTextIconsOnAccent,
    Color? serviceGiftablesTextIconsSecondary,
    Color? serviceMartBackgroundAccent,
    Color? serviceMartBackgroundAccentSecondary,
    Color? serviceMartBackgroundCanvas,
    Color? serviceMartBackgroundStrong,
    Color? serviceMartBackgroundSubtle,
    Color? serviceMartStrokeAccent,
    Color? serviceMartStrokeAccentSecondary,
    Color? serviceMartStrokeDefault,
    Color? serviceMartTextIconsDefault,
    Color? serviceMartTextIconsOnAccent,
    Color? serviceMartTextIconsSecondary,
    Color? serviceRideBackgroundAccent,
    Color? serviceRideBackgroundAccentSecondary,
    Color? serviceRideBackgroundCanvas,
    Color? serviceRideBackgroundStrong,
    Color? serviceRideBackgroundSubtle,
    Color? serviceRideStrokeAccent,
    Color? serviceRideStrokeAccentSecondary,
    Color? serviceRideStrokeDefault,
    Color? serviceRideTextIconsDefault,
    Color? serviceRideTextIconsOnAccent,
    Color? serviceRideTextIconsSecondary,
  }) {
    return YakSemanticColors(
      backgroundBaseDarkMain:
          backgroundBaseDarkMain ?? this.backgroundBaseDarkMain,
      backgroundBaseDarkOpacity:
          backgroundBaseDarkOpacity ?? this.backgroundBaseDarkOpacity,
      backgroundBaseDarkSecond:
          backgroundBaseDarkSecond ?? this.backgroundBaseDarkSecond,
      backgroundBaseMain: backgroundBaseMain ?? this.backgroundBaseMain,
      backgroundBaseOpacity:
          backgroundBaseOpacity ?? this.backgroundBaseOpacity,
      backgroundBaseSecond: backgroundBaseSecond ?? this.backgroundBaseSecond,
      backgroundBaseThird: backgroundBaseThird ?? this.backgroundBaseThird,
      backgroundBlueMain: backgroundBlueMain ?? this.backgroundBlueMain,
      backgroundBlueSecond: backgroundBlueSecond ?? this.backgroundBlueSecond,
      backgroundDangerMain: backgroundDangerMain ?? this.backgroundDangerMain,
      backgroundDangerSecond:
          backgroundDangerSecond ?? this.backgroundDangerSecond,
      backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
      backgroundPrimaryMain:
          backgroundPrimaryMain ?? this.backgroundPrimaryMain,
      backgroundPrimarySecond:
          backgroundPrimarySecond ?? this.backgroundPrimarySecond,
      backgroundPurpleMain: backgroundPurpleMain ?? this.backgroundPurpleMain,
      backgroundPurpleSecond:
          backgroundPurpleSecond ?? this.backgroundPurpleSecond,
      backgroundRedMain: backgroundRedMain ?? this.backgroundRedMain,
      backgroundRedSecond: backgroundRedSecond ?? this.backgroundRedSecond,
      backgroundSuccessMain:
          backgroundSuccessMain ?? this.backgroundSuccessMain,
      backgroundSuccessSecond:
          backgroundSuccessSecond ?? this.backgroundSuccessSecond,
      backgroundWarningMain:
          backgroundWarningMain ?? this.backgroundWarningMain,
      backgroundWarningSecond:
          backgroundWarningSecond ?? this.backgroundWarningSecond,
      textIconsBaseMain: textIconsBaseMain ?? this.textIconsBaseMain,
      textIconsBaseSecond: textIconsBaseSecond ?? this.textIconsBaseSecond,
      textIconsBlue: textIconsBlue ?? this.textIconsBlue,
      textIconsDanger: textIconsDanger ?? this.textIconsDanger,
      textIconsDisabled: textIconsDisabled ?? this.textIconsDisabled,
      textIconsOnDark: textIconsOnDark ?? this.textIconsOnDark,
      textIconsOnLight: textIconsOnLight ?? this.textIconsOnLight,
      textIconsPrimary: textIconsPrimary ?? this.textIconsPrimary,
      textIconsPrimarySecond:
          textIconsPrimarySecond ?? this.textIconsPrimarySecond,
      textIconsPurple: textIconsPurple ?? this.textIconsPurple,
      textIconsRed: textIconsRed ?? this.textIconsRed,
      textIconsSuccess: textIconsSuccess ?? this.textIconsSuccess,
      textIconsWarning: textIconsWarning ?? this.textIconsWarning,
      strokeBase: strokeBase ?? this.strokeBase,
      strokeBaseDark: strokeBaseDark ?? this.strokeBaseDark,
      strokeBaseOpacity: strokeBaseOpacity ?? this.strokeBaseOpacity,
      strokeBlue: strokeBlue ?? this.strokeBlue,
      strokeDanger: strokeDanger ?? this.strokeDanger,
      strokePrimary: strokePrimary ?? this.strokePrimary,
      strokePurple: strokePurple ?? this.strokePurple,
      strokeRed: strokeRed ?? this.strokeRed,
      strokeSuccess: strokeSuccess ?? this.strokeSuccess,
      strokeWarning: strokeWarning ?? this.strokeWarning,
      interactionHover: interactionHover ?? this.interactionHover,
      interactionSelected: interactionSelected ?? this.interactionSelected,
      overlayScrim: overlayScrim ?? this.overlayScrim,
      serviceDineOutBackgroundAccent:
          serviceDineOutBackgroundAccent ?? this.serviceDineOutBackgroundAccent,
      serviceDineOutBackgroundAccentSecondary:
          serviceDineOutBackgroundAccentSecondary ??
          this.serviceDineOutBackgroundAccentSecondary,
      serviceDineOutBackgroundCanvas:
          serviceDineOutBackgroundCanvas ?? this.serviceDineOutBackgroundCanvas,
      serviceDineOutBackgroundStrong:
          serviceDineOutBackgroundStrong ?? this.serviceDineOutBackgroundStrong,
      serviceDineOutBackgroundSubtle:
          serviceDineOutBackgroundSubtle ?? this.serviceDineOutBackgroundSubtle,
      serviceDineOutStrokeAccent:
          serviceDineOutStrokeAccent ?? this.serviceDineOutStrokeAccent,
      serviceDineOutStrokeAccentSecondary:
          serviceDineOutStrokeAccentSecondary ??
          this.serviceDineOutStrokeAccentSecondary,
      serviceDineOutStrokeDefault:
          serviceDineOutStrokeDefault ?? this.serviceDineOutStrokeDefault,
      serviceDineOutTextIconsDefault:
          serviceDineOutTextIconsDefault ?? this.serviceDineOutTextIconsDefault,
      serviceDineOutTextIconsOnAccent:
          serviceDineOutTextIconsOnAccent ??
          this.serviceDineOutTextIconsOnAccent,
      serviceDineOutTextIconsSecondary:
          serviceDineOutTextIconsSecondary ??
          this.serviceDineOutTextIconsSecondary,
      serviceExpressBackgroundAccent:
          serviceExpressBackgroundAccent ?? this.serviceExpressBackgroundAccent,
      serviceExpressBackgroundAccentSecondary:
          serviceExpressBackgroundAccentSecondary ??
          this.serviceExpressBackgroundAccentSecondary,
      serviceExpressBackgroundCanvas:
          serviceExpressBackgroundCanvas ?? this.serviceExpressBackgroundCanvas,
      serviceExpressBackgroundStrong:
          serviceExpressBackgroundStrong ?? this.serviceExpressBackgroundStrong,
      serviceExpressBackgroundSubtle:
          serviceExpressBackgroundSubtle ?? this.serviceExpressBackgroundSubtle,
      serviceExpressStrokeAccent:
          serviceExpressStrokeAccent ?? this.serviceExpressStrokeAccent,
      serviceExpressStrokeAccentSecondary:
          serviceExpressStrokeAccentSecondary ??
          this.serviceExpressStrokeAccentSecondary,
      serviceExpressStrokeDefault:
          serviceExpressStrokeDefault ?? this.serviceExpressStrokeDefault,
      serviceExpressTextIconsDefault:
          serviceExpressTextIconsDefault ?? this.serviceExpressTextIconsDefault,
      serviceExpressTextIconsOnAccent:
          serviceExpressTextIconsOnAccent ??
          this.serviceExpressTextIconsOnAccent,
      serviceExpressTextIconsSecondary:
          serviceExpressTextIconsSecondary ??
          this.serviceExpressTextIconsSecondary,
      serviceFoodBackgroundAccent:
          serviceFoodBackgroundAccent ?? this.serviceFoodBackgroundAccent,
      serviceFoodBackgroundAccentSecondary:
          serviceFoodBackgroundAccentSecondary ??
          this.serviceFoodBackgroundAccentSecondary,
      serviceFoodBackgroundCanvas:
          serviceFoodBackgroundCanvas ?? this.serviceFoodBackgroundCanvas,
      serviceFoodBackgroundStrong:
          serviceFoodBackgroundStrong ?? this.serviceFoodBackgroundStrong,
      serviceFoodBackgroundSubtle:
          serviceFoodBackgroundSubtle ?? this.serviceFoodBackgroundSubtle,
      serviceFoodStrokeAccent:
          serviceFoodStrokeAccent ?? this.serviceFoodStrokeAccent,
      serviceFoodStrokeAccentSecondary:
          serviceFoodStrokeAccentSecondary ??
          this.serviceFoodStrokeAccentSecondary,
      serviceFoodStrokeDefault:
          serviceFoodStrokeDefault ?? this.serviceFoodStrokeDefault,
      serviceFoodTextIconsDefault:
          serviceFoodTextIconsDefault ?? this.serviceFoodTextIconsDefault,
      serviceFoodTextIconsOnAccent:
          serviceFoodTextIconsOnAccent ?? this.serviceFoodTextIconsOnAccent,
      serviceFoodTextIconsSecondary:
          serviceFoodTextIconsSecondary ?? this.serviceFoodTextIconsSecondary,
      serviceGiftablesBackgroundAccent:
          serviceGiftablesBackgroundAccent ??
          this.serviceGiftablesBackgroundAccent,
      serviceGiftablesBackgroundAccentSecondary:
          serviceGiftablesBackgroundAccentSecondary ??
          this.serviceGiftablesBackgroundAccentSecondary,
      serviceGiftablesBackgroundCanvas:
          serviceGiftablesBackgroundCanvas ??
          this.serviceGiftablesBackgroundCanvas,
      serviceGiftablesBackgroundStrong:
          serviceGiftablesBackgroundStrong ??
          this.serviceGiftablesBackgroundStrong,
      serviceGiftablesBackgroundSubtle:
          serviceGiftablesBackgroundSubtle ??
          this.serviceGiftablesBackgroundSubtle,
      serviceGiftablesStrokeAccent:
          serviceGiftablesStrokeAccent ?? this.serviceGiftablesStrokeAccent,
      serviceGiftablesStrokeAccentSecondary:
          serviceGiftablesStrokeAccentSecondary ??
          this.serviceGiftablesStrokeAccentSecondary,
      serviceGiftablesStrokeDefault:
          serviceGiftablesStrokeDefault ?? this.serviceGiftablesStrokeDefault,
      serviceGiftablesTextIconsDefault:
          serviceGiftablesTextIconsDefault ??
          this.serviceGiftablesTextIconsDefault,
      serviceGiftablesTextIconsOnAccent:
          serviceGiftablesTextIconsOnAccent ??
          this.serviceGiftablesTextIconsOnAccent,
      serviceGiftablesTextIconsSecondary:
          serviceGiftablesTextIconsSecondary ??
          this.serviceGiftablesTextIconsSecondary,
      serviceMartBackgroundAccent:
          serviceMartBackgroundAccent ?? this.serviceMartBackgroundAccent,
      serviceMartBackgroundAccentSecondary:
          serviceMartBackgroundAccentSecondary ??
          this.serviceMartBackgroundAccentSecondary,
      serviceMartBackgroundCanvas:
          serviceMartBackgroundCanvas ?? this.serviceMartBackgroundCanvas,
      serviceMartBackgroundStrong:
          serviceMartBackgroundStrong ?? this.serviceMartBackgroundStrong,
      serviceMartBackgroundSubtle:
          serviceMartBackgroundSubtle ?? this.serviceMartBackgroundSubtle,
      serviceMartStrokeAccent:
          serviceMartStrokeAccent ?? this.serviceMartStrokeAccent,
      serviceMartStrokeAccentSecondary:
          serviceMartStrokeAccentSecondary ??
          this.serviceMartStrokeAccentSecondary,
      serviceMartStrokeDefault:
          serviceMartStrokeDefault ?? this.serviceMartStrokeDefault,
      serviceMartTextIconsDefault:
          serviceMartTextIconsDefault ?? this.serviceMartTextIconsDefault,
      serviceMartTextIconsOnAccent:
          serviceMartTextIconsOnAccent ?? this.serviceMartTextIconsOnAccent,
      serviceMartTextIconsSecondary:
          serviceMartTextIconsSecondary ?? this.serviceMartTextIconsSecondary,
      serviceRideBackgroundAccent:
          serviceRideBackgroundAccent ?? this.serviceRideBackgroundAccent,
      serviceRideBackgroundAccentSecondary:
          serviceRideBackgroundAccentSecondary ??
          this.serviceRideBackgroundAccentSecondary,
      serviceRideBackgroundCanvas:
          serviceRideBackgroundCanvas ?? this.serviceRideBackgroundCanvas,
      serviceRideBackgroundStrong:
          serviceRideBackgroundStrong ?? this.serviceRideBackgroundStrong,
      serviceRideBackgroundSubtle:
          serviceRideBackgroundSubtle ?? this.serviceRideBackgroundSubtle,
      serviceRideStrokeAccent:
          serviceRideStrokeAccent ?? this.serviceRideStrokeAccent,
      serviceRideStrokeAccentSecondary:
          serviceRideStrokeAccentSecondary ??
          this.serviceRideStrokeAccentSecondary,
      serviceRideStrokeDefault:
          serviceRideStrokeDefault ?? this.serviceRideStrokeDefault,
      serviceRideTextIconsDefault:
          serviceRideTextIconsDefault ?? this.serviceRideTextIconsDefault,
      serviceRideTextIconsOnAccent:
          serviceRideTextIconsOnAccent ?? this.serviceRideTextIconsOnAccent,
      serviceRideTextIconsSecondary:
          serviceRideTextIconsSecondary ?? this.serviceRideTextIconsSecondary,
    );
  }

  @override
  YakSemanticColors lerp(ThemeExtension<YakSemanticColors>? other, double t) {
    if (other is! YakSemanticColors) return this;
    return YakSemanticColors(
      backgroundBaseDarkMain: Color.lerp(
        backgroundBaseDarkMain,
        other.backgroundBaseDarkMain,
        t,
      )!,
      backgroundBaseDarkOpacity: Color.lerp(
        backgroundBaseDarkOpacity,
        other.backgroundBaseDarkOpacity,
        t,
      )!,
      backgroundBaseDarkSecond: Color.lerp(
        backgroundBaseDarkSecond,
        other.backgroundBaseDarkSecond,
        t,
      )!,
      backgroundBaseMain: Color.lerp(
        backgroundBaseMain,
        other.backgroundBaseMain,
        t,
      )!,
      backgroundBaseOpacity: Color.lerp(
        backgroundBaseOpacity,
        other.backgroundBaseOpacity,
        t,
      )!,
      backgroundBaseSecond: Color.lerp(
        backgroundBaseSecond,
        other.backgroundBaseSecond,
        t,
      )!,
      backgroundBaseThird: Color.lerp(
        backgroundBaseThird,
        other.backgroundBaseThird,
        t,
      )!,
      backgroundBlueMain: Color.lerp(
        backgroundBlueMain,
        other.backgroundBlueMain,
        t,
      )!,
      backgroundBlueSecond: Color.lerp(
        backgroundBlueSecond,
        other.backgroundBlueSecond,
        t,
      )!,
      backgroundDangerMain: Color.lerp(
        backgroundDangerMain,
        other.backgroundDangerMain,
        t,
      )!,
      backgroundDangerSecond: Color.lerp(
        backgroundDangerSecond,
        other.backgroundDangerSecond,
        t,
      )!,
      backgroundDisabled: Color.lerp(
        backgroundDisabled,
        other.backgroundDisabled,
        t,
      )!,
      backgroundPrimaryMain: Color.lerp(
        backgroundPrimaryMain,
        other.backgroundPrimaryMain,
        t,
      )!,
      backgroundPrimarySecond: Color.lerp(
        backgroundPrimarySecond,
        other.backgroundPrimarySecond,
        t,
      )!,
      backgroundPurpleMain: Color.lerp(
        backgroundPurpleMain,
        other.backgroundPurpleMain,
        t,
      )!,
      backgroundPurpleSecond: Color.lerp(
        backgroundPurpleSecond,
        other.backgroundPurpleSecond,
        t,
      )!,
      backgroundRedMain: Color.lerp(
        backgroundRedMain,
        other.backgroundRedMain,
        t,
      )!,
      backgroundRedSecond: Color.lerp(
        backgroundRedSecond,
        other.backgroundRedSecond,
        t,
      )!,
      backgroundSuccessMain: Color.lerp(
        backgroundSuccessMain,
        other.backgroundSuccessMain,
        t,
      )!,
      backgroundSuccessSecond: Color.lerp(
        backgroundSuccessSecond,
        other.backgroundSuccessSecond,
        t,
      )!,
      backgroundWarningMain: Color.lerp(
        backgroundWarningMain,
        other.backgroundWarningMain,
        t,
      )!,
      backgroundWarningSecond: Color.lerp(
        backgroundWarningSecond,
        other.backgroundWarningSecond,
        t,
      )!,
      textIconsBaseMain: Color.lerp(
        textIconsBaseMain,
        other.textIconsBaseMain,
        t,
      )!,
      textIconsBaseSecond: Color.lerp(
        textIconsBaseSecond,
        other.textIconsBaseSecond,
        t,
      )!,
      textIconsBlue: Color.lerp(textIconsBlue, other.textIconsBlue, t)!,
      textIconsDanger: Color.lerp(textIconsDanger, other.textIconsDanger, t)!,
      textIconsDisabled: Color.lerp(
        textIconsDisabled,
        other.textIconsDisabled,
        t,
      )!,
      textIconsOnDark: Color.lerp(textIconsOnDark, other.textIconsOnDark, t)!,
      textIconsOnLight: Color.lerp(
        textIconsOnLight,
        other.textIconsOnLight,
        t,
      )!,
      textIconsPrimary: Color.lerp(
        textIconsPrimary,
        other.textIconsPrimary,
        t,
      )!,
      textIconsPrimarySecond: Color.lerp(
        textIconsPrimarySecond,
        other.textIconsPrimarySecond,
        t,
      )!,
      textIconsPurple: Color.lerp(textIconsPurple, other.textIconsPurple, t)!,
      textIconsRed: Color.lerp(textIconsRed, other.textIconsRed, t)!,
      textIconsSuccess: Color.lerp(
        textIconsSuccess,
        other.textIconsSuccess,
        t,
      )!,
      textIconsWarning: Color.lerp(
        textIconsWarning,
        other.textIconsWarning,
        t,
      )!,
      strokeBase: Color.lerp(strokeBase, other.strokeBase, t)!,
      strokeBaseDark: Color.lerp(strokeBaseDark, other.strokeBaseDark, t)!,
      strokeBaseOpacity: Color.lerp(
        strokeBaseOpacity,
        other.strokeBaseOpacity,
        t,
      )!,
      strokeBlue: Color.lerp(strokeBlue, other.strokeBlue, t)!,
      strokeDanger: Color.lerp(strokeDanger, other.strokeDanger, t)!,
      strokePrimary: Color.lerp(strokePrimary, other.strokePrimary, t)!,
      strokePurple: Color.lerp(strokePurple, other.strokePurple, t)!,
      strokeRed: Color.lerp(strokeRed, other.strokeRed, t)!,
      strokeSuccess: Color.lerp(strokeSuccess, other.strokeSuccess, t)!,
      strokeWarning: Color.lerp(strokeWarning, other.strokeWarning, t)!,
      interactionHover: Color.lerp(
        interactionHover,
        other.interactionHover,
        t,
      )!,
      interactionSelected: Color.lerp(
        interactionSelected,
        other.interactionSelected,
        t,
      )!,
      overlayScrim: Color.lerp(overlayScrim, other.overlayScrim, t)!,
      serviceDineOutBackgroundAccent: Color.lerp(
        serviceDineOutBackgroundAccent,
        other.serviceDineOutBackgroundAccent,
        t,
      )!,
      serviceDineOutBackgroundAccentSecondary: Color.lerp(
        serviceDineOutBackgroundAccentSecondary,
        other.serviceDineOutBackgroundAccentSecondary,
        t,
      )!,
      serviceDineOutBackgroundCanvas: Color.lerp(
        serviceDineOutBackgroundCanvas,
        other.serviceDineOutBackgroundCanvas,
        t,
      )!,
      serviceDineOutBackgroundStrong: Color.lerp(
        serviceDineOutBackgroundStrong,
        other.serviceDineOutBackgroundStrong,
        t,
      )!,
      serviceDineOutBackgroundSubtle: Color.lerp(
        serviceDineOutBackgroundSubtle,
        other.serviceDineOutBackgroundSubtle,
        t,
      )!,
      serviceDineOutStrokeAccent: Color.lerp(
        serviceDineOutStrokeAccent,
        other.serviceDineOutStrokeAccent,
        t,
      )!,
      serviceDineOutStrokeAccentSecondary: Color.lerp(
        serviceDineOutStrokeAccentSecondary,
        other.serviceDineOutStrokeAccentSecondary,
        t,
      )!,
      serviceDineOutStrokeDefault: Color.lerp(
        serviceDineOutStrokeDefault,
        other.serviceDineOutStrokeDefault,
        t,
      )!,
      serviceDineOutTextIconsDefault: Color.lerp(
        serviceDineOutTextIconsDefault,
        other.serviceDineOutTextIconsDefault,
        t,
      )!,
      serviceDineOutTextIconsOnAccent: Color.lerp(
        serviceDineOutTextIconsOnAccent,
        other.serviceDineOutTextIconsOnAccent,
        t,
      )!,
      serviceDineOutTextIconsSecondary: Color.lerp(
        serviceDineOutTextIconsSecondary,
        other.serviceDineOutTextIconsSecondary,
        t,
      )!,
      serviceExpressBackgroundAccent: Color.lerp(
        serviceExpressBackgroundAccent,
        other.serviceExpressBackgroundAccent,
        t,
      )!,
      serviceExpressBackgroundAccentSecondary: Color.lerp(
        serviceExpressBackgroundAccentSecondary,
        other.serviceExpressBackgroundAccentSecondary,
        t,
      )!,
      serviceExpressBackgroundCanvas: Color.lerp(
        serviceExpressBackgroundCanvas,
        other.serviceExpressBackgroundCanvas,
        t,
      )!,
      serviceExpressBackgroundStrong: Color.lerp(
        serviceExpressBackgroundStrong,
        other.serviceExpressBackgroundStrong,
        t,
      )!,
      serviceExpressBackgroundSubtle: Color.lerp(
        serviceExpressBackgroundSubtle,
        other.serviceExpressBackgroundSubtle,
        t,
      )!,
      serviceExpressStrokeAccent: Color.lerp(
        serviceExpressStrokeAccent,
        other.serviceExpressStrokeAccent,
        t,
      )!,
      serviceExpressStrokeAccentSecondary: Color.lerp(
        serviceExpressStrokeAccentSecondary,
        other.serviceExpressStrokeAccentSecondary,
        t,
      )!,
      serviceExpressStrokeDefault: Color.lerp(
        serviceExpressStrokeDefault,
        other.serviceExpressStrokeDefault,
        t,
      )!,
      serviceExpressTextIconsDefault: Color.lerp(
        serviceExpressTextIconsDefault,
        other.serviceExpressTextIconsDefault,
        t,
      )!,
      serviceExpressTextIconsOnAccent: Color.lerp(
        serviceExpressTextIconsOnAccent,
        other.serviceExpressTextIconsOnAccent,
        t,
      )!,
      serviceExpressTextIconsSecondary: Color.lerp(
        serviceExpressTextIconsSecondary,
        other.serviceExpressTextIconsSecondary,
        t,
      )!,
      serviceFoodBackgroundAccent: Color.lerp(
        serviceFoodBackgroundAccent,
        other.serviceFoodBackgroundAccent,
        t,
      )!,
      serviceFoodBackgroundAccentSecondary: Color.lerp(
        serviceFoodBackgroundAccentSecondary,
        other.serviceFoodBackgroundAccentSecondary,
        t,
      )!,
      serviceFoodBackgroundCanvas: Color.lerp(
        serviceFoodBackgroundCanvas,
        other.serviceFoodBackgroundCanvas,
        t,
      )!,
      serviceFoodBackgroundStrong: Color.lerp(
        serviceFoodBackgroundStrong,
        other.serviceFoodBackgroundStrong,
        t,
      )!,
      serviceFoodBackgroundSubtle: Color.lerp(
        serviceFoodBackgroundSubtle,
        other.serviceFoodBackgroundSubtle,
        t,
      )!,
      serviceFoodStrokeAccent: Color.lerp(
        serviceFoodStrokeAccent,
        other.serviceFoodStrokeAccent,
        t,
      )!,
      serviceFoodStrokeAccentSecondary: Color.lerp(
        serviceFoodStrokeAccentSecondary,
        other.serviceFoodStrokeAccentSecondary,
        t,
      )!,
      serviceFoodStrokeDefault: Color.lerp(
        serviceFoodStrokeDefault,
        other.serviceFoodStrokeDefault,
        t,
      )!,
      serviceFoodTextIconsDefault: Color.lerp(
        serviceFoodTextIconsDefault,
        other.serviceFoodTextIconsDefault,
        t,
      )!,
      serviceFoodTextIconsOnAccent: Color.lerp(
        serviceFoodTextIconsOnAccent,
        other.serviceFoodTextIconsOnAccent,
        t,
      )!,
      serviceFoodTextIconsSecondary: Color.lerp(
        serviceFoodTextIconsSecondary,
        other.serviceFoodTextIconsSecondary,
        t,
      )!,
      serviceGiftablesBackgroundAccent: Color.lerp(
        serviceGiftablesBackgroundAccent,
        other.serviceGiftablesBackgroundAccent,
        t,
      )!,
      serviceGiftablesBackgroundAccentSecondary: Color.lerp(
        serviceGiftablesBackgroundAccentSecondary,
        other.serviceGiftablesBackgroundAccentSecondary,
        t,
      )!,
      serviceGiftablesBackgroundCanvas: Color.lerp(
        serviceGiftablesBackgroundCanvas,
        other.serviceGiftablesBackgroundCanvas,
        t,
      )!,
      serviceGiftablesBackgroundStrong: Color.lerp(
        serviceGiftablesBackgroundStrong,
        other.serviceGiftablesBackgroundStrong,
        t,
      )!,
      serviceGiftablesBackgroundSubtle: Color.lerp(
        serviceGiftablesBackgroundSubtle,
        other.serviceGiftablesBackgroundSubtle,
        t,
      )!,
      serviceGiftablesStrokeAccent: Color.lerp(
        serviceGiftablesStrokeAccent,
        other.serviceGiftablesStrokeAccent,
        t,
      )!,
      serviceGiftablesStrokeAccentSecondary: Color.lerp(
        serviceGiftablesStrokeAccentSecondary,
        other.serviceGiftablesStrokeAccentSecondary,
        t,
      )!,
      serviceGiftablesStrokeDefault: Color.lerp(
        serviceGiftablesStrokeDefault,
        other.serviceGiftablesStrokeDefault,
        t,
      )!,
      serviceGiftablesTextIconsDefault: Color.lerp(
        serviceGiftablesTextIconsDefault,
        other.serviceGiftablesTextIconsDefault,
        t,
      )!,
      serviceGiftablesTextIconsOnAccent: Color.lerp(
        serviceGiftablesTextIconsOnAccent,
        other.serviceGiftablesTextIconsOnAccent,
        t,
      )!,
      serviceGiftablesTextIconsSecondary: Color.lerp(
        serviceGiftablesTextIconsSecondary,
        other.serviceGiftablesTextIconsSecondary,
        t,
      )!,
      serviceMartBackgroundAccent: Color.lerp(
        serviceMartBackgroundAccent,
        other.serviceMartBackgroundAccent,
        t,
      )!,
      serviceMartBackgroundAccentSecondary: Color.lerp(
        serviceMartBackgroundAccentSecondary,
        other.serviceMartBackgroundAccentSecondary,
        t,
      )!,
      serviceMartBackgroundCanvas: Color.lerp(
        serviceMartBackgroundCanvas,
        other.serviceMartBackgroundCanvas,
        t,
      )!,
      serviceMartBackgroundStrong: Color.lerp(
        serviceMartBackgroundStrong,
        other.serviceMartBackgroundStrong,
        t,
      )!,
      serviceMartBackgroundSubtle: Color.lerp(
        serviceMartBackgroundSubtle,
        other.serviceMartBackgroundSubtle,
        t,
      )!,
      serviceMartStrokeAccent: Color.lerp(
        serviceMartStrokeAccent,
        other.serviceMartStrokeAccent,
        t,
      )!,
      serviceMartStrokeAccentSecondary: Color.lerp(
        serviceMartStrokeAccentSecondary,
        other.serviceMartStrokeAccentSecondary,
        t,
      )!,
      serviceMartStrokeDefault: Color.lerp(
        serviceMartStrokeDefault,
        other.serviceMartStrokeDefault,
        t,
      )!,
      serviceMartTextIconsDefault: Color.lerp(
        serviceMartTextIconsDefault,
        other.serviceMartTextIconsDefault,
        t,
      )!,
      serviceMartTextIconsOnAccent: Color.lerp(
        serviceMartTextIconsOnAccent,
        other.serviceMartTextIconsOnAccent,
        t,
      )!,
      serviceMartTextIconsSecondary: Color.lerp(
        serviceMartTextIconsSecondary,
        other.serviceMartTextIconsSecondary,
        t,
      )!,
      serviceRideBackgroundAccent: Color.lerp(
        serviceRideBackgroundAccent,
        other.serviceRideBackgroundAccent,
        t,
      )!,
      serviceRideBackgroundAccentSecondary: Color.lerp(
        serviceRideBackgroundAccentSecondary,
        other.serviceRideBackgroundAccentSecondary,
        t,
      )!,
      serviceRideBackgroundCanvas: Color.lerp(
        serviceRideBackgroundCanvas,
        other.serviceRideBackgroundCanvas,
        t,
      )!,
      serviceRideBackgroundStrong: Color.lerp(
        serviceRideBackgroundStrong,
        other.serviceRideBackgroundStrong,
        t,
      )!,
      serviceRideBackgroundSubtle: Color.lerp(
        serviceRideBackgroundSubtle,
        other.serviceRideBackgroundSubtle,
        t,
      )!,
      serviceRideStrokeAccent: Color.lerp(
        serviceRideStrokeAccent,
        other.serviceRideStrokeAccent,
        t,
      )!,
      serviceRideStrokeAccentSecondary: Color.lerp(
        serviceRideStrokeAccentSecondary,
        other.serviceRideStrokeAccentSecondary,
        t,
      )!,
      serviceRideStrokeDefault: Color.lerp(
        serviceRideStrokeDefault,
        other.serviceRideStrokeDefault,
        t,
      )!,
      serviceRideTextIconsDefault: Color.lerp(
        serviceRideTextIconsDefault,
        other.serviceRideTextIconsDefault,
        t,
      )!,
      serviceRideTextIconsOnAccent: Color.lerp(
        serviceRideTextIconsOnAccent,
        other.serviceRideTextIconsOnAccent,
        t,
      )!,
      serviceRideTextIconsSecondary: Color.lerp(
        serviceRideTextIconsSecondary,
        other.serviceRideTextIconsSecondary,
        t,
      )!,
    );
  }
}
