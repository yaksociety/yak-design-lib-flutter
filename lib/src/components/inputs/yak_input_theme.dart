import 'package:flutter/material.dart';

import '../../tokens/generated/colors.dart';
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

  static double verificationBoxSize(YakInputSize size) {
    return switch (size) {
      YakInputSize.sm => AppDimensions.mainSystemNum40,
      YakInputSize.md => AppDimensions.mainSystemNum44,
      YakInputSize.lg => AppDimensions.mainSystemNum48,
    };
  }

  static TextStyle labelStyle({bool isDestructive = false}) {
    return AppTextStyles.textSMedium.copyWith(
      color: isDestructive
          ? AppColors.textIconsDanger
          : AppColors.textIconsBaseMain,
    );
  }

  static TextStyle helperStyle({bool isDestructive = false}) {
    return AppTextStyles.textSRegular.copyWith(
      color: isDestructive
          ? AppColors.textIconsDanger
          : AppColors.textIconsBaseSecond,
    );
  }

  static TextStyle fieldTextStyle({bool enabled = true}) {
    return AppTextStyles.textMRegular.copyWith(
      color: enabled
          ? AppColors.textIconsBaseMain
          : AppColors.textIconsDisabled,
    );
  }

  static TextStyle placeholderStyle() {
    return AppTextStyles.textMRegular.copyWith(
      color: AppColors.textIconsBaseSecond,
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
    final radius = BorderRadius.circular(AppRadii.roundnessRoundOutside);
    final borderColor = isDestructive
        ? AppColors.strokeDanger
        : isFocused
        ? AppColors.strokePrimary
        : AppColors.strokeBase;
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
    final fieldHeight = heightFor(size);
    final verticalPad = ((fieldHeight - 2 - lineHeight) / 2).clamp(8.0, 16.0);

    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: enabled
          ? AppColors.backgroundBaseMain
          : AppColors.backgroundDisabled,
      hintText: hintText,
      hintStyle: placeholderStyle(),
      errorText: errorText,
      errorStyle: errorText == null
          ? null
          : helperStyle(isDestructive: true).copyWith(height: 0, fontSize: 0),
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
        isDestructive ? AppColors.strokeDanger : AppColors.strokePrimary,
        width: 2,
      ),
      disabledBorder: border(AppColors.strokeBase),
      errorBorder: border(AppColors.strokeDanger),
      focusedErrorBorder: border(AppColors.strokeDanger, width: 2),
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
    final borderColor = isDestructive
        ? AppColors.strokeDanger
        : isFocused
        ? AppColors.strokePrimary
        : AppColors.strokeBase;

    return BoxDecoration(
      color: enabled
          ? AppColors.backgroundBaseMain
          : AppColors.backgroundDisabled,
      borderRadius: BorderRadius.circular(AppRadii.roundnessRoundOutside),
      border: Border.all(color: borderColor, width: isFocused ? 2 : 1),
    );
  }

  static Color indicatorColor(YakInputIndicatorType type) {
    return switch (type) {
      YakInputIndicatorType.active => AppColors.warning500,
      YakInputIndicatorType.inactive => AppColors.neutral300,
      YakInputIndicatorType.positive => AppColors.success500,
      YakInputIndicatorType.negative => AppColors.danger500,
      YakInputIndicatorType.number => AppColors.primary500,
    };
  }

  static Color toggleTrackColor({required bool isOn}) {
    return isOn ? AppColors.success500 : AppColors.neutral200;
  }

  static Color toggleThumbColor() => AppColors.backgroundBaseMain;

  static TextStyle toggleLabelStyle() {
    return AppTextStyles.textMMedium.copyWith(
      color: AppColors.textIconsBaseMain,
    );
  }
}

/// Supernova Indicator types.
enum YakInputIndicatorType { active, inactive, positive, negative, number }

/// Supernova Title-Progress statuses.
enum YakTitleProgressStatus { success, inProgress, cancel, unsuccessful }
