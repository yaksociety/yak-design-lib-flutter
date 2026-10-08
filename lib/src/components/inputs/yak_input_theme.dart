import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/dimensions.dart';
import '../../tokens/generated/radii.dart';
import '../../tokens/generated/text_styles.dart';

/// Supernova input sizes (S / M / L — no XS for inputs).
enum YakInputSize { sm, md, lg }

/// Supernova Input field visual states.
enum YakInputState { placeholder, filled, focused, disabled, destructive }

/// Maps Supernova input tokens to Flutter [InputDecoration] and typography.
abstract final class YakInputTheme {
  static double heightFor(YakInputSize size) {
    return switch (size) {
      YakInputSize.sm => AppDimensions.mainSystemNum40,
      YakInputSize.md => AppDimensions.mainSystemNum44,
      YakInputSize.lg => AppDimensions.mainSystemNum48,
    };
  }

  /// Prefer [YakThemeExtension] heights when available (same S/M/L as buttons).
  static double heightForTheme(BuildContext context, YakInputSize size) {
    final yakTheme = context.yakTheme;
    return switch (size) {
      YakInputSize.sm => yakTheme.heightSm,
      YakInputSize.md => yakTheme.heightMd,
      YakInputSize.lg => yakTheme.heightLg,
    };
  }

  static double verificationBoxSize(YakInputSize size) {
    return heightFor(size);
  }

  static double verificationBoxSizeTheme(
    BuildContext context,
    YakInputSize size,
  ) {
    return heightForTheme(context, size);
  }

  /// Pass to `TextField.onTapOutside` so tapping anywhere else dismisses
  /// focus and the keyboard. Taps on other text fields don't count as outside.
  static void unfocusOnTapOutside(PointerDownEvent event) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static TextStyle labelStyle(
    BuildContext context, {
    bool isDestructive = false,
  }) {
    final colors = context.yakColors;
    return AppTextStyles.textSMedium.copyWith(
      color: isDestructive ? colors.textIconsDanger : colors.textIconsBaseMain,
    );
  }

  static TextStyle helperStyle(
    BuildContext context, {
    bool isDestructive = false,
  }) {
    final colors = context.yakColors;
    return AppTextStyles.textSRegular.copyWith(
      color: isDestructive
          ? colors.textIconsDanger
          : colors.textIconsBaseSecond,
    );
  }

  static TextStyle fieldTextStyle(BuildContext context, {bool enabled = true}) {
    final colors = context.yakColors;
    return AppTextStyles.textMRegular.copyWith(
      color: enabled ? colors.textIconsBaseMain : colors.textIconsDisabled,
    );
  }

  static TextStyle placeholderStyle(BuildContext context) {
    return AppTextStyles.textMRegular.copyWith(
      color: context.yakColors.textIconsBaseSecond,
    );
  }

  static InputDecoration decoration({
    required BuildContext context,
    String? hintText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    YakInputSize size = YakInputSize.md,
    bool enabled = true,
    bool isFocused = false,
    bool isDestructive = false,
    EdgeInsetsGeometry? contentPadding,
  }) {
    final colors = context.yakColors;
    final radius = BorderRadius.circular(AppRadii.roundnessRoundOutside);
    final borderColor = isDestructive
        ? colors.strokeDanger
        : isFocused
        ? colors.strokePrimary
        : colors.strokeBase;
    final borderWidth = isFocused ? 2.0 : 1.0;

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    final lineHeight =
        AppTextStyles.textMRegular.fontSize! *
        (AppTextStyles.textMRegular.height ?? 1.0);
    final fieldHeight = heightForTheme(context, size);
    final verticalPad = ((fieldHeight - 2 - lineHeight) / 2).clamp(8.0, 16.0);

    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: enabled
          ? colors.backgroundBaseMain
          : colors.backgroundDisabled,
      hintText: hintText,
      hintStyle: placeholderStyle(context),
      errorText: errorText,
      errorStyle: errorText == null
          ? null
          : helperStyle(
              context,
              isDestructive: true,
            ).copyWith(height: 0, fontSize: 0),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding:
          contentPadding ??
          EdgeInsets.symmetric(
            horizontal: AppDimensions.mainSystemNum16,
            vertical: verticalPad,
          ),
      enabledBorder: border(borderColor, width: borderWidth),
      focusedBorder: border(
        isDestructive ? colors.strokeDanger : colors.strokePrimary,
        width: 2,
      ),
      disabledBorder: border(colors.strokeBase),
      errorBorder: border(colors.strokeDanger),
      focusedErrorBorder: border(colors.strokeDanger, width: 2),
      border: border(borderColor, width: borderWidth),
    );
  }

  static BoxDecoration verificationBoxDecoration({
    required BuildContext context,
    required bool isFocused,
    required bool isFilled,
    bool isDestructive = false,
    bool enabled = true,
  }) {
    final colors = context.yakColors;
    final borderColor = isDestructive
        ? colors.strokeDanger
        : isFocused
        ? colors.strokePrimary
        : colors.strokeBase;

    return BoxDecoration(
      color: enabled ? colors.backgroundBaseMain : colors.backgroundDisabled,
      borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
      border: Border.all(color: borderColor, width: isFocused ? 2 : 1),
    );
  }

  static Color indicatorColor(
    BuildContext context,
    YakInputIndicatorType type,
  ) {
    final colors = context.yakColors;
    return switch (type) {
      YakInputIndicatorType.active => colors.backgroundWarningMain,
      YakInputIndicatorType.inactive => colors.backgroundBaseThird,
      YakInputIndicatorType.positive => colors.backgroundSuccessMain,
      YakInputIndicatorType.negative => colors.backgroundDangerMain,
      YakInputIndicatorType.number => colors.backgroundPrimaryMain,
    };
  }

  static Color toggleTrackColor(BuildContext context, {required bool isOn}) {
    final colors = context.yakColors;
    return isOn ? colors.backgroundSuccessMain : colors.backgroundBaseThird;
  }

  static Color toggleThumbColor(BuildContext context) =>
      context.yakColors.textIconsOnDark;

  static TextStyle toggleLabelStyle(BuildContext context) {
    return AppTextStyles.textMMedium.copyWith(
      color: context.yakColors.textIconsBaseMain,
    );
  }
}

/// Supernova Indicator types.
enum YakInputIndicatorType { active, inactive, positive, negative, number }

/// Supernova Title-Progress statuses.
enum YakTitleProgressStatus { success, inProgress, cancel, unsuccessful }
