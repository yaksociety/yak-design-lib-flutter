# Components

Hand-written Flutter widgets mapped to all **160** Supernova / Figma top-level components.

## Registry

[`supernova_component_registry.dart`](supernova_component_registry.dart) lists every Figma component and how it is represented:

| Kind       | Count | Representation                                           |
| ---------- | ----- | -------------------------------------------------------- |
| `widget`   | 118   | Flutter widget class (exported from package)             |
| `asset`    | 36    | Static assets in `assets/` (logos, illustrations, icons) |
| `template` | 6     | Compose from other widgets (Figma layout shells)         |

Regenerate after Supernova sync:

```bash
# Update tool/supernova_figma_components.csv from Supernova MCP get_figma_component_list
python3 tool/generate_supernova_components.py
```

## Folders

| Folder        | Examples                                                        |
| ------------- | --------------------------------------------------------------- |
| `buttons/`    | `YakButton`, `YakPrimaryButton`, `YakActions`, `YakIconButton`  |
| `inputs/`     | `YakTextField`, `YakCheckbox`, `YakToggle`, `YakSearchField`    |
| `navigation/` | `YakBottomNavigation`, `YakTabs`, `YakBreadcrumb`               |
| `overlays/`   | `YakModal`, `YakBottomSheet`, `YakFooterSheet`                  |
| `feedback/`   | `YakAlert`, `YakNotification`                                   |
| `display/`    | `YakAvatar`, `YakBadge`, `YakBanner`, `YakChip`                 |
| `data/`       | `YakProgressBar`, `YakRating`, `YakStepper`, `YakCarousel`      |
| `surfaces/`   | `YakAccordion`                                                  |
| `domain/`     | Rider/finance cards: `YakCardTransaction`, `YakProfileRider`, … |

## Asset libraries (not widgets)

These Supernova components are **asset collections** — add files under `assets/` and reference via `YakAssets` (future) or app-specific paths:

- Bank Logos, Payment Logos, Social platforms logos
- Icon, YAK-Expression, YAK-Poses, illustration, logo-app
- Device chrome: status-bar, home-indicator, iPhone, Android

## Adding a component

1. Add widget under the matching folder (or `domain/` for app-specific cards).
2. Map name in `tool/generate_supernova_components.py` → `WIDGET_MAP`.
3. Run `python3 tool/generate_supernova_components.py`.
4. Export from [`yak_design_lib_flutter.dart`](../../yak_design_lib_flutter.dart).
5. Preview in [`example/lib/main.dart`](../../../example/lib/main.dart).
