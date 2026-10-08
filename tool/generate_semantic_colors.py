#!/usr/bin/env python3
"""Generate YakSemanticColors (Light / Dark) from the Figma "Semantic: Color" export.

Usage:
    # Replace tool/yak_semantic_color.json with a fresh Figma variables export
    python3 tool/generate_semantic_colors.py
"""

from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = Path(__file__).parent / "yak_semantic_color.json"
OUTPUT = ROOT / "lib/src/tokens/generated/semantic_colors.dart"
CLASS_NAME = "YakSemanticColors"

# Figma documentation frames, not product colors.
EXCLUDED_PREFIXES = ("Section/",)


def to_dart_name(path: str) -> str:
    if path.startswith("Core/"):
        path = path[len("Core/"):]
    text = path.replace("&", " ").replace("/", " ")
    parts = re.split(r"[\s\-]+", text.strip())
    parts = [re.sub(r"[^A-Za-z0-9]", "", p) for p in parts]
    parts = [p for p in parts if p]
    name = parts[0][0].lower() + parts[0][1:]
    for part in parts[1:]:
        name += part[0].upper() + part[1:]
    return name


def to_hex(rgba: dict) -> str:
    def channel(value: float) -> int:
        return max(0, min(255, round(value * 255)))

    a = channel(rgba.get("a", 1))
    r, g, b = channel(rgba["r"]), channel(rgba["g"]), channel(rgba["b"])
    return f"0x{a:02X}{r:02X}{g:02X}{b:02X}"


def sort_key(path: str) -> tuple[int, str]:
    order = (
        "Core/Background/",
        "Core/Text & Icons/",
        "Core/Stroke/",
        "Core/Interaction/",
        "Core/Overlay/",
        "Service/",
    )
    for index, prefix in enumerate(order):
        if path.startswith(prefix):
            return index, path
    return len(order), path


def main() -> None:
    data = json.loads(SOURCE.read_text(encoding="utf-8"))
    modes = {name: mode_id for mode_id, name in data["modes"].items()}
    light_id, dark_id = modes["Light"], modes["Dark"]

    tokens: list[dict] = []
    seen: set[str] = set()
    for variable in data["variables"]:
        path = variable["name"]
        if variable["type"] != "COLOR" or path.startswith(EXCLUDED_PREFIXES):
            continue
        name = to_dart_name(path)
        if name in seen:
            raise SystemExit(f"Duplicate Dart name {name} for {path}")
        seen.add(name)
        resolved = variable["resolvedValuesByMode"]
        tokens.append(
            {
                "path": path,
                "name": name,
                "description": variable.get("description", "").strip(),
                "light": to_hex(resolved[light_id]["resolvedValue"]),
                "dark": to_hex(resolved[dark_id]["resolvedValue"]),
                "light_alias": resolved[light_id].get("alias") and resolved[light_id].get("aliasName"),
                "dark_alias": resolved[dark_id].get("alias") and resolved[dark_id].get("aliasName"),
            }
        )

    tokens.sort(key=lambda t: sort_key(t["path"]))

    lines: list[str] = [
        "// GENERATED — run: python3 tool/generate_semantic_colors.py",
        "// Source: tool/yak_semantic_color.json (Figma collection \"Semantic: Color\").",
        "",
        "import 'package:flutter/material.dart';",
        "",
        "/// YAK semantic color roles with Light and Dark values.",
        "///",
        "/// Read from the active theme via `context.yakColors`.",
        "@immutable",
        f"class {CLASS_NAME} extends ThemeExtension<{CLASS_NAME}> {{",
        f"  const {CLASS_NAME}({{",
    ]
    lines += [f"    required this.{t['name']}," for t in tokens]
    lines += ["  });", ""]

    for t in tokens:
        lines.append(f"  /// {t['path']}")
        light = t["light_alias"] or "raw"
        dark = t["dark_alias"] or "raw"
        lines.append(f"  ///")
        lines.append(f"  /// Light: {light} · Dark: {dark}")
        if t["description"]:
            lines.append("  ///")
            lines.append(f"  /// {t['description']}")
        lines.append(f"  final Color {t['name']};")
        lines.append("")

    for mode in ("light", "dark"):
        lines.append(f"  static const {mode} = {CLASS_NAME}(")
        lines += [f"    {t['name']}: Color({t[mode]})," for t in tokens]
        lines.append("  );")
        lines.append("")

    lines.append("  /// Figma variable path → resolved color, in Figma collection order.")
    lines.append("  Map<String, Color> toMap() => {")
    lines += [f"    '{t['path']}': {t['name']}," for t in tokens]
    lines.append("  };")
    lines.append("")

    lines.append("  @override")
    lines.append(f"  {CLASS_NAME} copyWith({{")
    lines += [f"    Color? {t['name']}," for t in tokens]
    lines.append("  }) {")
    lines.append(f"    return {CLASS_NAME}(")
    lines += [f"      {t['name']}: {t['name']} ?? this.{t['name']}," for t in tokens]
    lines.append("    );")
    lines.append("  }")
    lines.append("")

    lines.append("  @override")
    lines.append(f"  {CLASS_NAME} lerp(ThemeExtension<{CLASS_NAME}>? other, double t) {{")
    lines.append(f"    if (other is! {CLASS_NAME}) return this;")
    lines.append(f"    return {CLASS_NAME}(")
    lines += [
        f"      {t['name']}: Color.lerp({t['name']}, other.{t['name']}, t)!,"
        for t in tokens
    ]
    lines.append("    );")
    lines.append("  }")
    lines.append("}")
    lines.append("")

    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    try:
        subprocess.run(["dart", "format", str(OUTPUT)], check=True, capture_output=True)
    except (OSError, subprocess.CalledProcessError):
        print("warning: `dart format` failed; output left unformatted")
    print(f"Generated {len(tokens)} semantic colors -> {OUTPUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
