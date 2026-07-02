import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/yak_theme_extension.dart';
import '../../tokens/generated/colors.dart';
import '../../tokens/generated/text_styles.dart';
import '../buttons/yak_primary_button.dart';
import 'yak_input_theme.dart';

export 'yak_input_theme.dart';

/// Field label (Supernova: Label).
class YakLabel extends StatelessWidget {
  const YakLabel({
    super.key,
    required this.text,
    this.isRequired = false,
    this.isDestructive = false,
    this.size = YakInputSize.md,
  });

  final String text;
  final bool isRequired;
  final bool isDestructive;
  final YakInputSize size;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? AppColors.textIconsDanger
        : AppColors.textIconsBaseMain;
    final style = switch (size) {
      YakInputSize.sm => AppTextStyles.textXSMedium.copyWith(color: color),
      YakInputSize.md => YakInputTheme.labelStyle(isDestructive: isDestructive),
      YakInputSize.lg => AppTextStyles.textMMedium.copyWith(color: color),
    };

    return Text.rich(
      TextSpan(
        text: text,
        style: style,
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: TextStyle(color: context.yakTheme.danger),
            ),
        ],
      ),
    );
  }
}

/// Helper text below inputs (Supernova: hint text).
class YakHintText extends StatelessWidget {
  const YakHintText({
    super.key,
    required this.text,
    this.isDestructive = false,
  });

  final String text;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: YakInputTheme.helperStyle(isDestructive: isDestructive),
    );
  }
}

/// Shared label + field + helper layout for Supernova inputs.
class YakInputFieldShell extends StatelessWidget {
  const YakInputFieldShell({
    super.key,
    this.label,
    required this.field,
    this.helperText,
    this.isDestructive = false,
    this.isRequired = false,
    this.labelSize = YakInputSize.md,
  });

  final String? label;
  final Widget field;
  final String? helperText;
  final bool isDestructive;
  final bool isRequired;
  final YakInputSize labelSize;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          YakLabel(
            text: label!,
            isRequired: isRequired,
            isDestructive: isDestructive,
            size: labelSize,
          ),
          SizedBox(height: yakTheme.spacingXs),
        ],
        field,
        if (helperText != null) ...[
          SizedBox(height: yakTheme.spacingXs),
          YakHintText(text: helperText!, isDestructive: isDestructive),
        ],
      ],
    );
  }
}

/// Text input (Supernova: Input field).
class YakTextField extends StatefulWidget {
  const YakTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.isRequired = false,
    this.size = YakInputSize.md,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.onSubmitted,
  });

  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool isRequired;
  final YakInputSize size;
  final int maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  State<YakTextField> createState() => _YakTextFieldState();
}

class _YakTextFieldState extends State<YakTextField> {
  final _focusNode = FocusNode();
  var _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocus);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocus() => setState(() => _focused = _focusNode.hasFocus);

  @override
  Widget build(BuildContext context) {
    final isDestructive = widget.errorText != null;
    final helper = isDestructive ? widget.errorText : widget.helperText;

    return YakInputFieldShell(
      label: widget.label,
      helperText: helper,
      isDestructive: isDestructive,
      isRequired: widget.isRequired,
      labelSize: widget.size,
      field: SizedBox(
        height: widget.maxLines > 1
            ? null
            : YakInputTheme.heightFor(widget.size),
        child: TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          textInputAction: widget.textInputAction,
          textAlignVertical: widget.maxLines > 1
              ? TextAlignVertical.top
              : TextAlignVertical.center,
          style: YakInputTheme.fieldTextStyle(),
          decoration: YakInputTheme.decoration(
            context: context,
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            size: widget.size,
            enabled: widget.enabled,
            isFocused: _focused,
            isDestructive: isDestructive,
          ),
        ),
      ),
    );
  }
}

/// Multiline input (Supernova: Input Text area).
class YakTextArea extends StatelessWidget {
  const YakTextArea({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.minLines = 4,
    this.isRequired = false,
    this.size = YakInputSize.md,
  });

  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final bool isRequired;
  final YakInputSize size;

  @override
  Widget build(BuildContext context) {
    return YakTextField(
      label: label,
      hint: hint,
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      onChanged: onChanged,
      isRequired: isRequired,
      keyboardType: TextInputType.multiline,
      maxLines: minLines,
      minLines: minLines,
      size: size,
    );
  }
}

/// OTP / PIN boxes (Supernova: Input Verification code).
class YakVerificationCodeInput extends StatefulWidget {
  const YakVerificationCodeInput({
    super.key,
    this.length = 4,
    this.size = YakInputSize.md,
    this.onCompleted,
    this.onChanged,
  });

  final int length;
  final YakInputSize size;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;

  @override
  State<YakVerificationCodeInput> createState() =>
      _YakVerificationCodeInputState();
}

class _YakVerificationCodeInputState extends State<YakVerificationCodeInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _notify() {
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == widget.length) widget.onCompleted?.call(code);
  }

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final boxSize = YakInputTheme.verificationBoxSize(widget.size);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.length; i++) ...[
          if (i > 0) SizedBox(width: yakTheme.spacingSm),
          SizedBox(
            width: boxSize,
            height: boxSize,
            child: Focus(
              onFocusChange: (_) => setState(() {}),
              child: Builder(
                builder: (context) {
                  final focused = _focusNodes[i].hasFocus;
                  final filled = _controllers[i].text.isNotEmpty;
                  return DecoratedBox(
                    decoration: YakInputTheme.verificationBoxDecoration(
                      context: context,
                      isFocused: focused,
                      isFilled: filled,
                    ),
                    child: TextField(
                      controller: _controllers[i],
                      focusNode: _focusNodes[i],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: YakInputTheme.fieldTextStyle(),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty && i < widget.length - 1) {
                          _focusNodes[i + 1].requestFocus();
                        }
                        if (value.isEmpty && i > 0) {
                          _focusNodes[i - 1].requestFocus();
                        }
                        setState(() {});
                        _notify();
                      },
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Phone input with country prefix (Supernova: Phone Number).
class YakPhoneNumberField extends StatelessWidget {
  const YakPhoneNumberField({
    super.key,
    this.label = 'Phone number',
    this.countryCode = '+66',
    this.flagLabel = '🇹🇭',
    this.controller,
    this.onChanged,
    this.helperText,
    this.errorText,
    this.onCountryTap,
  });

  final String label;
  final String countryCode;
  final String flagLabel;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? helperText;
  final String? errorText;
  final VoidCallback? onCountryTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return YakTextField(
      label: label,
      hint: '812345678',
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      prefixIcon: InkWell(
        onTap: onCountryTap,
        child: Padding(
          padding: EdgeInsets.only(
            left: yakTheme.spacingMd,
            right: yakTheme.spacingXs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(flagLabel, style: const TextStyle(fontSize: 18)),
              SizedBox(width: yakTheme.spacingXs),
              Text(countryCode, style: YakInputTheme.fieldTextStyle()),
              Icon(
                Icons.arrow_drop_down,
                color: yakTheme.textSecondary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Search input with label (Supernova: Search).
class YakSearchField extends StatelessWidget {
  const YakSearchField({
    super.key,
    this.label,
    this.hint = 'Search',
    this.helperText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.suffixIcon,
    this.size = YakInputSize.md,
  });

  final String? label;
  final String hint;
  final String? helperText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final Widget? suffixIcon;
  final YakInputSize size;

  @override
  Widget build(BuildContext context) {
    return YakTextField(
      label: label,
      hint: hint,
      helperText: helperText,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      size: size,
      prefixIcon: const Icon(Icons.search),
      suffixIcon:
          suffixIcon ??
          (onClear == null
              ? null
              : IconButton(onPressed: onClear, icon: const Icon(Icons.clear))),
    );
  }
}

/// Search field with trailing Search button (Supernova: Search Display).
class YakSearchDisplay extends StatelessWidget {
  const YakSearchDisplay({
    super.key,
    this.hint = 'Search',
    this.buttonLabel = 'Search',
    this.onSearch,
    this.onChanged,
    this.size = YakInputSize.md,
  });

  final String hint;
  final String buttonLabel;
  final VoidCallback? onSearch;
  final ValueChanged<String>? onChanged;
  final YakInputSize size;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: YakSearchField(hint: hint, onChanged: onChanged, size: size),
        ),
        SizedBox(width: yakTheme.spacingSm),
        YakPrimaryButton(label: buttonLabel, onPressed: onSearch),
      ],
    );
  }
}

/// Compact search with trailing action (Supernova: Search Action).
class YakSearchAction extends StatelessWidget {
  const YakSearchAction({
    super.key,
    this.hint = 'Search',
    this.actionIcon = Icons.tune,
    this.onAction,
    this.onChanged,
    this.filled = false,
  });

  final String hint;
  final IconData actionIcon;
  final VoidCallback? onAction;
  final ValueChanged<String>? onChanged;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return YakSearchField(
      hint: hint,
      onChanged: onChanged,
      suffixIcon: IconButton(onPressed: onAction, icon: Icon(actionIcon)),
    );
  }
}

/// Search result row (helper for search flows).
class YakSearchResult extends StatelessWidget {
  const YakSearchResult({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      onTap: onTap,
    );
  }
}

/// Message composer (Supernova: Chat — Type=Message).
class YakChatInput extends StatelessWidget {
  const YakChatInput({
    super.key,
    this.hint = 'Type a message',
    this.controller,
    this.onSend,
    this.onChanged,
  });

  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onSend;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: YakTextField(
            hint: hint,
            controller: controller,
            onChanged: onChanged,
            maxLines: 3,
            minLines: 1,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => onSend?.call(),
          ),
        ),
        SizedBox(width: yakTheme.spacingSm),
        IconButton.filled(onPressed: onSend, icon: const Icon(Icons.send)),
      ],
    );
  }
}

/// Comment composer (Supernova: Comment — Type=Message).
class YakCommentInput extends StatelessWidget {
  const YakCommentInput({
    super.key,
    this.hint = 'Write a comment',
    this.controller,
    this.onSend,
    this.onChanged,
  });

  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onSend;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return YakChatInput(
      hint: hint,
      controller: controller,
      onSend: onSend,
      onChanged: onChanged,
    );
  }
}

/// Status dot (Supernova: Indicator).
class YakInputIndicator extends StatelessWidget {
  const YakInputIndicator({
    super.key,
    this.type = YakInputIndicatorType.active,
    this.size = 8,
    this.label,
  });

  final YakInputIndicatorType type;
  final double size;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final color = YakInputTheme.indicatorColor(type);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        if (label != null) ...[
          SizedBox(width: context.yakTheme.spacingXs),
          Text(label!, style: YakInputTheme.helperStyle()),
        ],
      ],
    );
  }
}

/// Dot step row (Supernova: Steps).
class YakInputSteps extends StatelessWidget {
  const YakInputSteps({
    super.key,
    required this.stepCount,
    required this.currentStep,
    this.isPositive = true,
  });

  final int stepCount;
  final int currentStep;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final activeColor = isPositive ? yakTheme.success : yakTheme.danger;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < stepCount; i++) ...[
          if (i > 0) SizedBox(width: yakTheme.spacingXs),
          Container(
            width: i == currentStep ? 10 : 8,
            height: i == currentStep ? 10 : 8,
            decoration: BoxDecoration(
              color: i <= currentStep ? activeColor : yakTheme.borderDefault,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    );
  }
}

/// Inline progress status (Supernova: Title-Progress).
class YakInputTitleProgress extends StatelessWidget {
  const YakInputTitleProgress({
    super.key,
    required this.title,
    this.status = YakTitleProgressStatus.success,
  });

  final String title;
  final YakTitleProgressStatus status;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final (icon, color) = switch (status) {
      YakTitleProgressStatus.success => (Icons.check_circle, yakTheme.success),
      YakTitleProgressStatus.inProgress => (Icons.autorenew, yakTheme.warning),
      YakTitleProgressStatus.cancel => (Icons.cancel, yakTheme.textSecondary),
      YakTitleProgressStatus.unsuccessful => (Icons.error, yakTheme.danger),
    };

    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: yakTheme.spacingSm),
        Text(title, style: YakInputTheme.labelStyle()),
      ],
    );
  }
}

/// Dropdown select (Supernova: Selects).
class YakSelect<T> extends StatelessWidget {
  const YakSelect({
    super.key,
    required this.label,
    required this.items,
    required this.itemLabel,
    this.value,
    this.onChanged,
    this.hint,
    this.helperText,
    this.size = YakInputSize.md,
  });

  final String label;
  final List<T> items;
  final String Function(T) itemLabel;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final String? helperText;
  final YakInputSize size;

  @override
  Widget build(BuildContext context) {
    return YakInputFieldShell(
      label: label,
      helperText: helperText,
      labelSize: size,
      field: DropdownButtonFormField<T>(
        initialValue: value,
        hint: hint == null
            ? null
            : Text(hint!, style: YakInputTheme.placeholderStyle()),
        items: [
          for (final item in items)
            DropdownMenuItem(value: item, child: Text(itemLabel(item))),
        ],
        onChanged: onChanged,
        decoration: YakInputTheme.decoration(context: context, size: size),
      ),
    );
  }
}

/// Country picker (Supernova: Country).
class YakCountrySelect extends StatelessWidget {
  const YakCountrySelect({
    super.key,
    this.value,
    this.onChanged,
    this.countries = const ['Thailand', 'Singapore', 'Malaysia'],
  });

  final String? value;
  final ValueChanged<String?>? onChanged;
  final List<String> countries;

  @override
  Widget build(BuildContext context) {
    return YakSelect<String>(
      label: 'Country',
      items: countries,
      itemLabel: (c) => c,
      value: value,
      onChanged: onChanged,
      hint: 'Select country',
    );
  }
}

/// Checkbox with label (Supernova: Checkbox).
class YakCheckbox extends StatelessWidget {
  const YakCheckbox({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.isDestructive = false,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final activeColor = isDestructive ? yakTheme.danger : null;

    return CheckboxListTile(
      value: value,
      onChanged: onChanged == null ? null : (v) => onChanged!(v ?? false),
      title: Text(label, style: YakInputTheme.fieldTextStyle()),
      activeColor: activeColor,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

/// Multiple checkboxes (Supernova: Checkbox group).
class YakCheckboxGroup extends StatelessWidget {
  const YakCheckboxGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final Set<String> selected;
  final void Function(String option, bool isSelected) onChanged;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      children: [
        for (final option in options) ...[
          YakCheckbox(
            label: option,
            value: selected.contains(option),
            onChanged: (v) => onChanged(option, v),
          ),
          SizedBox(height: yakTheme.spacingXs),
        ],
      ],
    );
  }
}

/// Switch toggle (Supernova: Toggle).
class YakToggle extends StatelessWidget {
  const YakToggle({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(label, style: YakInputTheme.fieldTextStyle()),
      contentPadding: EdgeInsets.zero,
    );
  }
}

/// Value slider (Supernova: Slider).
class YakSlider extends StatelessWidget {
  const YakSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.label,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) YakLabel(text: label!),
        Slider(value: value, min: min, max: max, onChanged: onChanged),
      ],
    );
  }
}

/// File picker (Supernova: File Upload).
class YakFileUpload extends StatelessWidget {
  const YakFileUpload({
    super.key,
    this.label = 'Upload file',
    this.hint = 'Tap to choose a file',
    this.onTap,
  });

  final String label;
  final String hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return YakInputFieldShell(
      label: label,
      field: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(yakTheme.spacingLg),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: yakTheme.borderDefault),
            borderRadius: BorderRadius.circular(yakTheme.radiusMd),
          ),
          child: Column(
            children: [
              Icon(Icons.upload_file, color: yakTheme.textSecondary),
              SizedBox(height: yakTheme.spacingSm),
              Text(hint, style: YakInputTheme.helperStyle()),
            ],
          ),
        ),
      ),
    );
  }
}

/// Rich text area with toolbar (Supernova: RichtextEditor + RichtextToolbar).
class YakRichTextEditor extends StatelessWidget {
  const YakRichTextEditor({
    super.key,
    this.label,
    this.controller,
    this.hint = 'Write something...',
    this.helperText,
  });

  final String? label;
  final TextEditingController? controller;
  final String hint;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return YakInputFieldShell(
      label: label,
      helperText: helperText,
      field: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const YakRichTextToolbar(),
          SizedBox(height: yakTheme.spacingSm),
          YakTextArea(hint: hint, controller: controller, minLines: 6),
        ],
      ),
    );
  }
}

/// Formatting toolbar (Supernova: RichtextToolbar).
class YakRichTextToolbar extends StatelessWidget {
  const YakRichTextToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: yakTheme.spacingSm,
        vertical: yakTheme.spacingXs,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: yakTheme.borderDefault),
        borderRadius: BorderRadius.circular(yakTheme.radiusSm),
      ),
      child: const Wrap(
        spacing: 4,
        children: [
          IconButton(onPressed: null, icon: Icon(Icons.format_bold, size: 20)),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.format_italic, size: 20),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.format_list_bulleted, size: 20),
          ),
          IconButton(onPressed: null, icon: Icon(Icons.link, size: 20)),
        ],
      ),
    );
  }
}

/// Address picker row (Supernova: address-picker).
class YakAddressPicker extends StatelessWidget {
  const YakAddressPicker({
    super.key,
    required this.label,
    this.value,
    this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(yakTheme.radiusMd),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: yakTheme.spacingSm),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined, color: yakTheme.textSecondary),
            SizedBox(width: yakTheme.spacingSm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: YakInputTheme.labelStyle()),
                  if (value != null)
                    Text(value!, style: YakInputTheme.helperStyle()),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

/// Date display (Supernova: Display Date).
class YakDisplayDate extends StatelessWidget {
  const YakDisplayDate({super.key, required this.date, this.format});

  final DateTime date;
  final String Function(DateTime)? format;

  @override
  Widget build(BuildContext context) {
    final text =
        format?.call(date) ??
        '${date.day.toString().padLeft(2, '0')}/'
            '${date.month.toString().padLeft(2, '0')}/'
            '${date.year}';
    return Text(text, style: YakInputTheme.fieldTextStyle());
  }
}

/// Calendar date picker trigger (Supernova: Calendar).
class YakCalendar extends StatelessWidget {
  const YakCalendar({
    super.key,
    required this.label,
    this.selectedDate,
    this.onDateSelected,
    this.helperText,
  });

  final String label;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  final String? helperText;

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) onDateSelected?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDateSelected == null ? null : () => _pick(context),
      child: YakTextField(
        label: label,
        hint: 'Select date',
        helperText: helperText,
        enabled: false,
        suffixIcon: const Icon(Icons.calendar_today_outlined),
      ),
    );
  }
}

/// Inline calendar dropdown (Supernova: Calendar Dropdown).
typedef YakCalendarDropdown = YakCalendar;

/// Map location row (Supernova: location).
class YakLocationPicker extends StatelessWidget {
  const YakLocationPicker({super.key, required this.address, this.onTap});

  final String address;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakAddressPicker(label: 'Location', value: address, onTap: onTap);
  }
}

/// Map pin marker (Supernova: Map Pointer).
class YakMapPointer extends StatelessWidget {
  const YakMapPointer({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on, color: yakTheme.danger, size: 36),
        if (label != null)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: yakTheme.spacingSm,
              vertical: yakTheme.spacingXs,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(yakTheme.radiusSm),
              boxShadow: const [
                BoxShadow(blurRadius: 4, color: Colors.black26),
              ],
            ),
            child: Text(label!, style: YakInputTheme.helperStyle()),
          ),
      ],
    );
  }
}
