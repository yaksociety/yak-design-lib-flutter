#!/usr/bin/env python3
"""Generate Flutter token files from Supernova MCP CSV export."""

from __future__ import annotations

import csv
import re
from pathlib import Path

OUTPUT_DIR = Path(__file__).resolve().parents[1] / "lib/src/tokens/generated"

# Supernova path -> camelCase (matches Flutter exporter: join path with space, camelCase)
def to_dart_name(path: str) -> str:
    text = path.replace("&", " ").replace("/", " ")
    text = re.sub(r"\([^)]*\)", "", text)
    text = text.replace("->", " ")
    parts = re.split(r"[\s\-]+", text.strip())
    parts = [re.sub(r"[^A-Za-z0-9]", "", p) for p in parts if p]
    parts = [p for p in parts if p]
    if not parts:
        return "token"
    name = parts[0].lower()
    for part in parts[1:]:
        if part.isdigit():
            name += part
        else:
            name += part[0].upper() + part[1:]
    if name[0].isdigit():
        name = f"n{name}"
    return name


def parse_hex_color(value: str) -> str | None:
    value = value.strip()
    if value.startswith("#") and "/" not in value:
        hex_val = value[1:]
        if len(hex_val) == 6:
            return f"Color(0xFF{hex_val.upper()})"
        if len(hex_val) == 8:
            return f"Color(0x{hex_val.upper()})"
    # #RRGGBB / NN%
    match = re.match(r"#([0-9A-Fa-f]{6})\s*/\s*(\d+)%", value)
    if match:
        rgb, pct = match.groups()
        alpha = round(int(pct) * 255 / 100)
        return f"Color(0x{alpha:02X}{rgb.upper()})"
    # reference like #353841 (Gray/500) - extract hex
    match = re.search(r"#([0-9A-Fa-f]{6})", value)
    if match:
        return f"Color(0xFF{match.group(1).upper()})"
    return None


def parse_dimension(value: str) -> float | None:
    value = value.strip()
    match = re.match(r"^(-?\d+(?:\.\d+)?)px", value)
    if match:
        return float(match.group(1))
    match = re.search(r"^(-?\d+(?:\.\d+)?)px", value)
    if match:
        return float(match.group(1))
    return None


def parse_typography(value: str) -> dict | None:
    # 24px / 150% Google Sans 600
    match = re.match(
        r"(\d+)px\s*/\s*(\d+)%\s+(.+?)\s+(\d+)",
        value.strip(),
    )
    if not match:
        return None
    size, line_pct, family, weight = match.groups()
    return {
        "size": int(size),
        "height": int(line_pct) / 100,
        "family": family.strip(),
        "weight": int(weight),
    }


def parse_shadow(value: str) -> str | None:
    value = value.strip()
    shadows: list[str] = []

    # 0 1px 2px 0 #101828 / 4%
    match = re.match(
        r"0\s+(\d+)px\s+(\d+)px\s+0\s+#([0-9A-Fa-f]{6})\s*/\s*(\d+)%",
        value,
    )
    if match:
        y, blur, rgb, pct = match.groups()
        alpha = round(int(pct) * 255 / 100)
        shadows.append(
            f"BoxShadow(color: Color(0x{alpha:02X}{rgb.upper()}), "
            f"offset: Offset(0, {y}), blurRadius: {blur})"
        )

    # 0 25px 50px -12px #101828 / 25%
    match = re.match(
        r"0\s+(\d+)px\s+(\d+)px\s+(-?\d+)px\s+#([0-9A-Fa-f]{6})\s*/\s*(\d+)%",
        value,
    )
    if match:
        y, blur, spread, rgb, pct = match.groups()
        alpha = round(int(pct) * 255 / 100)
        shadows.append(
            f"BoxShadow(color: Color(0x{alpha:02X}{rgb.upper()}), "
            f"offset: Offset(0, {y}), blurRadius: {blur}, spreadRadius: {spread})"
        )

    # 0 0 0 3px #EFF1F3 (focus ring)
    match = re.match(r"0\s+0\s+0\s+(\d+)px\s+#([0-9A-Fa-f]{6})", value)
    if match:
        spread, rgb = match.groups()
        shadows.append(
            f"BoxShadow(color: Color(0xFF{rgb.upper()}), "
            f"offset: Offset.zero, blurRadius: 0, spreadRadius: {spread})"
        )

    # 0 0 40px 4px #101828 / 12%
    match = re.match(
        r"0\s+0\s+(\d+)px\s+(\d+)px\s+#([0-9A-Fa-f]{6})\s*/\s*(\d+)%",
        value,
    )
    if match:
        blur, spread, rgb, pct = match.groups()
        alpha = round(int(pct) * 255 / 100)
        shadows.append(
            f"BoxShadow(color: Color(0x{alpha:02X}{rgb.upper()}), "
            f"offset: Offset.zero, blurRadius: {blur}, spreadRadius: {spread})"
        )

    if "rgba" in value:
        for m in re.finditer(
            r"rgba\((\d+),\s*(\d+),\s*(\d+),\s*([\d.]+)\)\s+"
            r"(-?\d+)px\s+(-?\d+)px\s+(-?\d+)px(?:\s+(-?\d+)px)?",
            value,
        ):
            r, g, b, a, x, y, blur, spread = m.groups()
            spread = spread or "0"
            shadows.append(
                f"BoxShadow(color: Color.fromRGBO({r}, {g}, {b}, {a}), "
                f"offset: Offset({x}, {y}), blurRadius: {blur}, "
                f"spreadRadius: {spread})"
            )

    if not shadows:
        return None
    if len(shadows) == 1:
        return shadows[0]
    return f"[{', '.join(shadows)}]"


def load_tokens() -> list[tuple[str, str, str]]:
    csv_path = Path(__file__).parent / "supernova_tokens.csv"
    rows: list[tuple[str, str, str]] = []
    with csv_path.open(newline="", encoding="utf-8") as handle:
        reader = csv.reader(handle)
        next(reader, None)  # header
        for parts in reader:
            if len(parts) < 4:
                continue
            rows.append((parts[1], parts[2], parts[3]))
    return rows


def write_class(filename: str, class_name: str, body: str, extra_import: str = "") -> None:
    import_line = "import 'package:flutter/material.dart';\n\n" if extra_import else ""
    content = (
        "// GENERATED BY SUPERNOVA FLUTTER EXPORTER — DO NOT EDIT MANUALLY.\n"
        "// Token names match Supernova paths (camelCase). Re-sync via Supernova extension.\n\n"
        f"{import_line}"
        f"class {class_name} {{\n"
        f"{body}\n"
        f"  {class_name}._();\n"
        f"}}\n"
    )
    (OUTPUT_DIR / filename).write_text(content)


def main() -> None:
    tokens = load_tokens()
    colors: list[str] = []
    dimensions: list[str] = []
    radii: list[str] = []
    text_styles: list[str] = []
    shadows: list[str] = []
    gradients: list[str] = []

    seen: dict[str, set[str]] = {
        "colors": set(),
        "dimensions": set(),
        "radii": set(),
        "text_styles": set(),
        "shadows": set(),
        "gradients": set(),
    }

    for token_type, path, value in tokens:
        name = to_dart_name(path)
        if token_type == "Color":
            color = parse_hex_color(value)
            if color and name not in seen["colors"]:
                seen["colors"].add(name)
                colors.append(f"  /// Supernova: {path}\n  static const {name} = {color};")
        elif token_type == "Dimension":
            dim = parse_dimension(value)
            if dim is None:
                continue
            if path.startswith("Roundness/"):
                if name not in seen["radii"]:
                    seen["radii"].add(name)
                    radii.append(
                        f"  /// Supernova: {path}\n  static const {name} = {dim};"
                    )
            else:
                if name not in seen["dimensions"]:
                    seen["dimensions"].add(name)
                    dimensions.append(
                        f"  /// Supernova: {path}\n  static const {name} = {dim};"
                    )
        elif token_type == "Typography":
            typo = parse_typography(value)
            if typo and name not in seen["text_styles"]:
                seen["text_styles"].add(name)
                text_styles.append(
                    f"  /// Supernova: {path}\n"
                    f"  static const {name} = TextStyle(\n"
                    f"    fontFamily: '{typo['family']}',\n"
                    f"    fontFamilyFallback: ['Roboto', 'sans-serif'],\n"
                    f"    fontSize: {typo['size']},\n"
                    f"    fontWeight: FontWeight.w{typo['weight']},\n"
                    f"    height: {typo['height']},\n"
                    f"    letterSpacing: 0,\n"
                    f"  );"
                )
        elif token_type == "Shadow":
            shadow = parse_shadow(value)
            if shadow and name not in seen["shadows"]:
                seen["shadows"].add(name)
                shadows.append(
                    f"  /// Supernova: {path}\n  static const {name} = {shadow};"
                )
        elif token_type == "Gradient":
            if name not in seen["gradients"]:
                seen["gradients"].add(name)
                safe_value = value.strip().replace("*/", "* /")
                gradients.append(
                    f"  /// Supernova: {path}\n"
                    f"  /// Value: {safe_value}\n"
                    f"  static const {name} = LinearGradient(\n"
                    f"    colors: [Color(0x00000000), Color(0x00000000)],\n"
                    f"  );"
                )

    write_class("colors.dart", "AppColors", "\n\n".join(colors), "material")
    write_class("dimensions.dart", "AppDimensions", "\n\n".join(dimensions))
    write_class("radii.dart", "AppRadii", "\n\n".join(radii))
    write_class(
        "text_styles.dart",
        "AppTextStyles",
        "\n\n".join(text_styles),
        "material",
    )
    write_class("shadows.dart", "AppShadows", "\n\n".join(shadows), "material")
    if gradients:
        write_class(
            "gradients.dart",
            "AppGradients",
            "\n\n".join(gradients),
            "material",
        )

    print(f"Generated {len(colors)} colors, {len(dimensions)} dimensions, "
          f"{len(radii)} radii, {len(text_styles)} text styles, "
          f"{len(shadows)} shadows, {len(gradients)} gradients")


if __name__ == "__main__":
    main()
