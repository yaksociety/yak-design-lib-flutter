import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/yak_theme_extension.dart';

/// Field label (Supernova: Label).
class YakLabel extends StatelessWidget {
  const YakLabel({
    super.key,
    required this.text,
    this.isRequired = false,
  });

  final String text;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: Theme.of(context).textTheme.labelLarge,
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
    this.isError = false,
  });

  final String text;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: isError ? yakTheme.danger : yakTheme.textSecondary,
      ),
    );
  }
}

/// Text input (Supernova: Input field).
class YakTextField extends StatelessWidget {
  const YakTextField({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
  });

  final String? label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          YakLabel(text: label!),
          SizedBox(height: yakTheme.spacingXs),
        ],
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

/// Multiline input (Supernova: Input Text area).
class YakTextArea extends StatelessWidget {
  const YakTextArea({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.maxLines = 4,
  });

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return YakTextField(
      label: label,
      hint: hint,
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
    );
  }
}

/// OTP / PIN input (Supernova: Input Verification code).
class YakVerificationCodeInput extends StatefulWidget {
  const YakVerificationCodeInput({
    super.key,
    this.length = 6,
    this.onCompleted,
  });

  final int length;
  final ValueChanged<String>? onCompleted;

  @override
  State<YakVerificationCodeInput> createState() =>
      _YakVerificationCodeInputState();
}

class _YakVerificationCodeInputState extends State<YakVerificationCodeInput> {
  late final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: widget.length,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) {
        if (value.length == widget.length) widget.onCompleted?.call(value);
      },
      decoration: InputDecoration(
        counterText: '',
        hintText: List.filled(widget.length, '•').join(),
        contentPadding: EdgeInsets.symmetric(vertical: yakTheme.spacingMd),
      ),
    );
  }
}

/// Phone input with country prefix (Supernova: Phone Number).
class YakPhoneNumberField extends StatelessWidget {
  const YakPhoneNumberField({
    super.key,
    this.label = 'Phone number',
    this.countryCode = '+66',
    this.controller,
    this.onChanged,
  });

  final String label;
  final String countryCode;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return YakTextField(
      label: label,
      hint: '812345678',
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(countryCode, style: Theme.of(context).textTheme.bodyMedium),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }
}

/// Search input (Supernova: Search).
class YakSearchField extends StatelessWidget {
  const YakSearchField({
    super.key,
    this.hint = 'Search',
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return YakTextField(
      hint: hint,
      controller: controller,
      onChanged: onChanged,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: onClear == null
          ? null
          : IconButton(onPressed: onClear, icon: const Icon(Icons.clear)),
    );
  }
}

/// Search result row (Supernova: Search Display).
class YakSearchDisplay extends StatelessWidget {
  const YakSearchDisplay({
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

/// Search with action button (Supernova: Search Action).
class YakSearchAction extends StatelessWidget {
  const YakSearchAction({
    super.key,
    required this.hint,
    this.actionLabel = 'Filter',
    this.onAction,
    this.onChanged,
  });

  final String hint;
  final String actionLabel;
  final VoidCallback? onAction;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return Row(
      children: [
        Expanded(child: YakSearchField(hint: hint, onChanged: onChanged)),
        SizedBox(width: yakTheme.spacingSm),
        TextButton(onPressed: onAction, child: Text(actionLabel)),
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
  });

  final String label;
  final List<T> items;
  final String Function(T) itemLabel;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YakLabel(text: label),
        SizedBox(height: yakTheme.spacingXs),
        DropdownButtonFormField<T>(
          initialValue: value,
          hint: hint == null ? null : Text(hint!),
          items: [
            for (final item in items)
              DropdownMenuItem(value: item, child: Text(itemLabel(item))),
          ],
          onChanged: onChanged,
          decoration: const InputDecoration(),
        ),
      ],
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
      title: Text(label),
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
      title: Text(label),
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

/// File picker placeholder (Supernova: File Upload).
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YakLabel(text: label),
        SizedBox(height: yakTheme.spacingXs),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(yakTheme.radiusSm),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(yakTheme.spacingLg),
            decoration: BoxDecoration(
              border: Border.all(
                color: yakTheme.borderDefault,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(yakTheme.radiusSm),
            ),
            child: Column(
              children: [
                Icon(Icons.upload_file, color: yakTheme.textSecondary),
                SizedBox(height: yakTheme.spacingSm),
                Text(hint, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Rich text area with toolbar (Supernova: RichtextEditor + RichtextToolbar).
class YakRichTextEditor extends StatelessWidget {
  const YakRichTextEditor({
    super.key,
    this.controller,
    this.hint = 'Write something...',
  });

  final TextEditingController? controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const YakRichTextToolbar(),
        SizedBox(height: yakTheme.spacingSm),
        TextField(
          controller: controller,
          maxLines: 6,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}

/// Formatting toolbar for rich text (Supernova: RichtextToolbar).
class YakRichTextToolbar extends StatelessWidget {
  const YakRichTextToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 4,
      children: [
        IconButton(onPressed: null, icon: Icon(Icons.format_bold, size: 20)),
        IconButton(onPressed: null, icon: Icon(Icons.format_italic, size: 20)),
        IconButton(onPressed: null, icon: Icon(Icons.format_list_bulleted, size: 20)),
        IconButton(onPressed: null, icon: Icon(Icons.link, size: 20)),
      ],
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
      borderRadius: BorderRadius.circular(yakTheme.radiusSm),
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
                  Text(label, style: Theme.of(context).textTheme.labelLarge),
                  if (value != null)
                    Text(
                      value!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: yakTheme.textSecondary,
                      ),
                    ),
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
    final text = format?.call(date) ??
        '${date.day.toString().padLeft(2, '0')}/'
            '${date.month.toString().padLeft(2, '0')}/'
            '${date.year}';
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}

/// Calendar date picker trigger (Supernova: Calendar).
class YakCalendar extends StatelessWidget {
  const YakCalendar({
    super.key,
    required this.label,
    this.selectedDate,
    this.onDateSelected,
  });

  final String label;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;

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
        enabled: false,
        suffixIcon: const Icon(Icons.calendar_today_outlined),
      ),
    );
  }
}

/// Inline calendar dropdown (Supernova: Calendar Dropdown).
typedef YakCalendarDropdown = YakCalendar;

/// Map location row (Supernova: location / Map Pointer).
class YakLocationPicker extends StatelessWidget {
  const YakLocationPicker({
    super.key,
    required this.address,
    this.onTap,
  });

  final String address;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakAddressPicker(label: 'Location', value: address, onTap: onTap);
  }
}

/// Map pin marker widget (Supernova: Map Pointer).
class YakMapPointer extends StatelessWidget {
  const YakMapPointer({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on, color: context.yakTheme.danger, size: 36),
        if (label != null)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: yakTheme.spacingSm,
              vertical: yakTheme.spacingXs,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(yakTheme.radiusSm),
              boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
            ),
            child: Text(label!, style: Theme.of(context).textTheme.labelSmall),
          ),
      ],
    );
  }
}
