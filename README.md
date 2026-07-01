# yak_design_lib_flutter

Shared Yak design system for rider, merchant, and other Flutter apps. Tokens come from [Supernova](https://supernova.io); components and theme are hand-maintained in this package.

## Structure

```
lib/
├── yak_design_lib_flutter.dart     # Public API
└── src/
    ├── tokens/generated/           # Supernova Flutter exporter output
    ├── theme/                      # YakTheme + mapper
    └── components/                 # Shared widgets (see components/README.md)
        ├── buttons/
        ├── feedback/
        ├── display/
        └── surfaces/

example/                            # Widget catalog
```

## Use in an app

```yaml
dependencies:
  yak_design_lib_flutter:
    path: ../yak_design_lib_flutter
```

```dart
import 'package:yak_design_lib_flutter/yak_design_lib_flutter.dart';

MaterialApp(
  theme: YakTheme.light(),
  darkTheme: YakTheme.dark(),
  home: MyHomePage(),
);

// Components
YakPrimaryButton(label: 'Continue', onPressed: () {});
YakAlert(message: 'Saved', variant: YakAlertVariant.success);
YakAvatar(initials: 'YK');
```

## Components

All **160** Supernova Figma components are tracked in [`SupernovaComponentRegistry`](lib/src/components/supernova_component_registry.dart):

- **118** → Flutter widgets (`YakButton`, `YakTextField`, `YakCardTransaction`, …)
- **36** → Asset libraries (logos, illustrations — bundle in `assets/`)
- **6** → Figma layout templates

Browse the full index: `cd example && flutter run`

Regenerate after Supernova adds components: `python3 tool/generate_supernova_components.py`

See [`lib/src/components/README.md`](lib/src/components/README.md) for the folder map.

## Supernova setup

### Sync tokens (same names as Supernova)

From repo root, refresh `lib/src/tokens/generated/` from the latest Supernova export:

```bash
# 1. Update tool/supernova_tokens.csv via Supernova MCP or VS Code Synchronize
# 2. Regenerate Dart files with Supernova camelCase names:
python3 tool/generate_supernova_tokens.py
```

Token names match Supernova paths, e.g. `Main System/num-4` → `AppDimensions.mainSystemNum4`, `Text & Icons/Base-Main` → `AppColors.textIconsBaseMain`.

### Flutter exporter (VS Code)

1. Install **Flutter** exporter in Supernova (Code Integration → Store)
2. Install [Supernova VS Code extension](https://marketplace.visualstudio.com/items?itemName=SupernovaIO.pulsar-vsc-extension) in Cursor
3. Configure default exporter → output: `lib/src/tokens/generated`
4. Click **Synchronize current codebase**
5. Update `lib/src/theme/yak_theme_mapper.dart` if token names change

### 2. MCP (AI reads live tokens)

Copy [`.cursor/mcp.json.example`](.cursor/mcp.json.example) to your Cursor MCP config and replace `YOUR_DESIGN_SYSTEM_ID` with the ID from your Supernova URL.

## Development

```bash
flutter analyze
flutter test
cd example && flutter run
```

## Fonts

Typography tokens use **Google Sans**. Add font files to `assets/fonts/` and declare them in `pubspec.yaml`, or rely on `fontFamilyFallback` (Roboto) until fonts are bundled.
