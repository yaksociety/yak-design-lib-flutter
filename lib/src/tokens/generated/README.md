# Generated tokens

**Do not edit these files manually.** They are synced from Supernova.

## Re-sync from Supernova

1. Open the **Supernova** panel in Cursor (extension: `SupernovaIO.pulsar-vsc-extension`)
2. Configure default exporter → output: `lib/src/tokens/generated`
3. Click **Synchronize current codebase**
4. Update [`yak_theme_mapper.dart`](../../theme/yak_theme_mapper.dart) if token names changed
5. Run `flutter analyze && flutter test`

## Token sources (Supernova groups)

| File               | Supernova source                                                    |
| ------------------ | ------------------------------------------------------------------- |
| `colors.dart`      | Primary, Neutral, Gray, semantic Background / Text & Icons / Stroke |
| `dimensions.dart`  | Main System, Padding, Device                                        |
| `radii.dart`       | Roundness                                                           |
| `text_styles.dart` | Typography (Google Sans)                                            |
| `shadows.dart`     | Shadow                                                              |

## MCP (Cursor AI)

Add Supernova MCP in Cursor settings so AI can read live tokens:

```json
{
  "mcpServers": {
    "supernova": {
      "url": "https://mcp.supernova.io/mcp/ds/YOUR_DESIGN_SYSTEM_ID"
    }
  }
}
```

Get `YOUR_DESIGN_SYSTEM_ID` from your Supernova URL: `app.supernova.io/.../60216-my-design-system/...`
