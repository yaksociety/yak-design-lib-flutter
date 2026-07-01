import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';

/// Linear progress (Supernova: Progress bar / progress).
class YakProgressBar extends StatelessWidget {
  const YakProgressBar({
    super.key,
    required this.value,
    this.label,
  });

  final double value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!, style: Theme.of(context).textTheme.labelMedium),
        LinearProgressIndicator(value: value.clamp(0, 1)),
      ],
    );
  }
}

/// Circular progress (Supernova: Progress circle).
class YakProgressCircle extends StatelessWidget {
  const YakProgressCircle({
    super.key,
    required this.value,
    this.size = 48,
    this.showLabel = true,
  });

  final double value;
  final double size;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(value: value.clamp(0, 1)),
          if (showLabel)
            Text(
              '${(value * 100).round()}%',
              style: Theme.of(context).textTheme.labelSmall,
            ),
        ],
      ),
    );
  }
}

/// Semicircle gauge (Supernova: Progress semicircle).
class YakProgressSemicircle extends StatelessWidget {
  const YakProgressSemicircle({super.key, required this.value, this.size = 80});

  final double value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size / 2,
      child: CustomPaint(
        painter: _SemicirclePainter(
          value: value.clamp(0, 1),
          color: Theme.of(context).colorScheme.primary,
          trackColor: context.yakTheme.borderDefault,
        ),
      ),
    );
  }
}

class _SemicirclePainter extends CustomPainter {
  _SemicirclePainter({
    required this.value,
    required this.color,
    required this.trackColor,
  });

  final double value;
  final Color color;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    final track = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    final progress = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 3.14159, 3.14159, false, track);
    canvas.drawArc(rect, 3.14159, 3.14159 * value, false, progress);
  }

  @override
  bool shouldRepaint(covariant _SemicirclePainter oldDelegate) =>
      oldDelegate.value != value;
}

/// Generic progress alias.
typedef YakProgress = YakProgressBar;

/// Star rating (Supernova: Rating).
class YakRating extends StatelessWidget {
  const YakRating({
    super.key,
    required this.value,
    this.onChanged,
    this.max = 5,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= max; i++)
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onChanged == null ? null : () => onChanged!(i.toDouble()),
            icon: Icon(
              i <= value.round() ? Icons.star : Icons.star_border,
              color: context.yakTheme.warning,
              size: 24,
            ),
          ),
      ],
    );
  }
}

/// Step indicator (Supernova: Steps).
class YakSteps extends StatelessWidget {
  const YakSteps({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<String> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final active = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          if (i > 0)
            Expanded(
              child: Container(
                height: 2,
                color: i <= currentStep ? active : yakTheme.borderDefault,
              ),
            ),
          Column(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: i <= currentStep ? active : yakTheme.borderDefault,
                child: Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: i <= currentStep ? Colors.white : yakTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: yakTheme.spacingXs),
              Text(steps[i], style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ],
    );
  }
}

/// Numbered stepper (Supernova: Stepper).
class YakStepper extends StatelessWidget {
  const YakStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<Widget> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
      controlsBuilder: (_, _) => const SizedBox.shrink(),
      steps: [
        for (var i = 0; i < steps.length; i++)
          Step(
            title: Text('Step ${i + 1}'),
            content: steps[i],
            isActive: i == currentStep,
            state: i < currentStep
                ? StepState.complete
                : i == currentStep
                ? StepState.editing
                : StepState.indexed,
          ),
      ],
    );
  }
}

/// Stepper with dividers (Supernova: Divider stepper).
class YakDividerStepper extends StatelessWidget {
  const YakDividerStepper({
    super.key,
    required this.labels,
    required this.currentIndex,
  });

  final List<String> labels;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return YakSteps(steps: labels, currentStep: currentIndex);
  }
}

/// Referral progress stepper (Supernova: referral-stepper).
typedef YakReferralStepper = YakDividerStepper;

/// Title with progress (Supernova: Title-Progress).
class YakTitleProgress extends StatelessWidget {
  const YakTitleProgress({
    super.key,
    required this.title,
    required this.progress,
  });

  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: yakTheme.spacingSm),
        YakProgressBar(value: progress),
      ],
    );
  }
}

/// Password strength meter (Supernova: Password indicator).
class YakPasswordIndicator extends StatelessWidget {
  const YakPasswordIndicator({super.key, required this.strength});

  final double strength;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    final color = strength < 0.34
        ? yakTheme.danger
        : strength < 0.67
        ? yakTheme.warning
        : yakTheme.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: strength.clamp(0, 1),
          color: color,
          backgroundColor: yakTheme.borderDefault,
        ),
        SizedBox(height: yakTheme.spacingXs),
        Text(
          _label(strength),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
        ),
      ],
    );
  }

  String _label(double strength) {
    if (strength < 0.34) return 'Weak';
    if (strength < 0.67) return 'Medium';
    return 'Strong';
  }
}

/// Horizontal pager (Supernova: carousel).
class YakCarousel extends StatefulWidget {
  const YakCarousel({
    super.key,
    required this.children,
    this.height = 180,
  });

  final List<Widget> children;
  final double height;

  @override
  State<YakCarousel> createState() => _YakCarouselState();
}

class _YakCarouselState extends State<YakCarousel> {
  final _controller = PageController();
  var _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView(
            controller: _controller,
            onPageChanged: (p) => setState(() => _page = p),
            children: widget.children,
          ),
        ),
        SizedBox(height: yakTheme.spacingSm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.children.length; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: yakTheme.spacingXs / 2),
                width: i == _page ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == _page
                      ? Theme.of(context).colorScheme.primary
                      : yakTheme.borderDefault,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

/// Swipe action background (Supernova: Swipe left action).
class YakSwipeAction extends StatelessWidget {
  const YakSwipeAction({
    super.key,
    required this.child,
    this.onDelete,
    this.deleteLabel = 'Delete',
  });

  final Widget child;
  final VoidCallback? onDelete;
  final String deleteLabel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(child.hashCode),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: context.yakTheme.spacingMd),
        color: context.yakTheme.danger,
        child: Text(deleteLabel, style: const TextStyle(color: Colors.white)),
      ),
      onDismissed: (_) => onDelete?.call(),
      child: child,
    );
  }
}
