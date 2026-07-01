import 'package:flutter/material.dart';

import '../../theme/yak_theme_extension.dart';
import '../data/yak_data.dart';
import '../display/yak_badge.dart';
import '../display/yak_display.dart';

/// Base card shell for domain components.
class YakDomainCard extends StatelessWidget {
  const YakDomainCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;

    return Material(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(yakTheme.radiusMd),
        side: BorderSide(color: yakTheme.borderDefault),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.all(yakTheme.spacingMd),
          child: child,
        ),
      ),
    );
  }
}

class YakCardFinanceSummary extends StatelessWidget {
  const YakCardFinanceSummary({
    super.key,
    required this.balance,
    this.label = 'Balance',
    this.change,
  });

  final String balance;
  final String label;
  final String? change;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return YakDomainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          SizedBox(height: yakTheme.spacingXs),
          Text(balance, style: Theme.of(context).textTheme.headlineSmall),
          if (change != null)
            Text(change!, style: TextStyle(color: yakTheme.success)),
        ],
      ),
    );
  }
}

class YakCardMessage extends StatelessWidget {
  const YakCardMessage({
    super.key,
    required this.title,
    required this.message,
    this.timestamp,
  });

  final String title;
  final String message;
  final String? timestamp;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: YakComment(author: title, message: message, timestamp: timestamp),
    );
  }
}

class YakCardProgress extends StatelessWidget {
  const YakCardProgress({
    super.key,
    required this.title,
    required this.progress,
  });

  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: YakTitleProgress(title: title, progress: progress),
    );
  }
}

class YakCardTransaction extends StatelessWidget {
  const YakCardTransaction({
    super.key,
    required this.title,
    required this.amount,
    this.subtitle,
    this.isCredit = true,
  });

  final String title;
  final String amount;
  final String? subtitle;
  final bool isCredit;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return YakDomainCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                if (subtitle != null)
                  Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isCredit ? yakTheme.success : yakTheme.danger,
            ),
          ),
        ],
      ),
    );
  }
}

class YakCardTransfer extends StatelessWidget {
  const YakCardTransfer({
    super.key,
    required this.from,
    required this.to,
    required this.amount,
    this.status,
  });

  final String from;
  final String to;
  final String amount;
  final String? status;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return YakDomainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$from → $to', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: yakTheme.spacingSm),
          Text(amount, style: Theme.of(context).textTheme.headlineSmall),
          if (status != null) YakBadge(label: status!, variant: YakBadgeVariant.gray),
        ],
      ),
    );
  }
}

class YakFinanceSummary extends StatelessWidget {
  const YakFinanceSummary({super.key, required this.income, required this.expense});

  final String income;
  final String expense;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: YakCardFinanceSummary(balance: income, label: 'Income')),
        SizedBox(width: context.yakTheme.spacingSm),
        Expanded(child: YakCardFinanceSummary(balance: expense, label: 'Expense')),
      ],
    );
  }
}

class YakEarningSummary extends StatelessWidget {
  const YakEarningSummary({super.key, required this.total, this.period = 'This week'});

  final String total;
  final String period;

  @override
  Widget build(BuildContext context) {
    return YakCardFinanceSummary(balance: total, label: period);
  }
}

class YakEarningActivityCard extends StatelessWidget {
  const YakEarningActivityCard({
    super.key,
    required this.title,
    required this.amount,
    required this.time,
  });

  final String title;
  final String amount;
  final String time;

  @override
  Widget build(BuildContext context) {
    return YakCardTransaction(title: title, amount: amount, subtitle: time);
  }
}

class YakEarningProgress extends StatelessWidget {
  const YakEarningProgress({super.key, required this.target, required this.current});

  final double target;
  final double current;

  @override
  Widget build(BuildContext context) {
    return YakCardProgress(
      title: 'Earning goal',
      progress: target == 0 ? 0 : current / target,
    );
  }
}

class YakEarningRate extends StatelessWidget {
  const YakEarningRate({super.key, required this.rate});

  final String rate;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(child: Text('Rate: $rate'));
  }
}

class YakEarningType extends StatelessWidget {
  const YakEarningType({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return YakChip(label: type, selected: true);
  }
}

class YakFeatureCard extends StatelessWidget {
  const YakFeatureCard({
    super.key,
    required this.title,
    required this.description,
    this.votes,
  });

  final String title;
  final String description;
  final int? votes;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          Text(description),
          if (votes != null) YakBadge(label: '$votes votes'),
        ],
      ),
    );
  }
}

class YakFeatureComment extends StatelessWidget {
  const YakFeatureComment({super.key, required this.author, required this.comment});

  final String author;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(child: YakComment(author: author, message: comment));
  }
}

class YakFeatureProgress extends StatelessWidget {
  const YakFeatureProgress({super.key, required this.title, required this.progress});

  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return YakCardProgress(title: title, progress: progress);
  }
}

class YakFeatureVoteCta extends StatelessWidget {
  const YakFeatureVoteCta({super.key, this.onVote});

  final VoidCallback? onVote;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      onTap: onVote,
      child: const Text('Vote for this feature'),
    );
  }
}

class YakProfileRider extends StatelessWidget {
  const YakProfileRider({
    super.key,
    required this.name,
    this.rating = 5.0,
    this.vehicle,
  });

  final String name;
  final double rating;
  final String? vehicle;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: YakAvatarDescription(
        title: name,
        subtitle: vehicle,
        initials: name,
        trailing: YakRating(value: rating),
      ),
    );
  }
}

class YakVehicleCard extends StatelessWidget {
  const YakVehicleCard({super.key, required this.model, this.plate});

  final String model;
  final String? plate;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: ListTile(
        leading: const Icon(Icons.two_wheeler),
        title: Text(model),
        subtitle: plate == null ? null : Text(plate!),
      ),
    );
  }
}

class YakRiderType extends StatelessWidget {
  const YakRiderType({super.key, required this.type, this.selected = false, this.onTap});

  final String type;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakTile(title: type, selected: selected, onTap: onTap, leading: const Icon(Icons.delivery_dining));
  }
}

class YakJobType extends StatelessWidget {
  const YakJobType({super.key, required this.type, this.selected = false, this.onTap});

  final String type;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakTile(title: type, selected: selected, onTap: onTap);
  }
}

class YakParcelType extends StatelessWidget {
  const YakParcelType({super.key, required this.type, this.selected = false, this.onTap});

  final String type;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakTile(title: type, selected: selected, onTap: onTap, leading: const Icon(Icons.inventory_2_outlined));
  }
}

class YakAdditionalService extends StatelessWidget {
  const YakAdditionalService({super.key, required this.label, this.icon, this.onTap});

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakActionItem(title: label, icon: icon ?? Icons.add_circle_outline, onTap: onTap);
  }
}

class YakPaymentMethod extends StatelessWidget {
  const YakPaymentMethod({super.key, required this.label, this.selected = false, this.onTap});

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakTile(title: label, selected: selected, onTap: onTap, leading: const Icon(Icons.payment));
  }
}

class YakPaymentFail extends StatelessWidget {
  const YakPaymentFail({super.key, this.message = 'Payment failed'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: Row(
        children: [
          Icon(Icons.error_outline, color: context.yakTheme.danger),
          SizedBox(width: context.yakTheme.spacingSm),
          Expanded(child: Text(message)),
        ],
      ),
    );
  }
}

class YakPayoutState extends StatelessWidget {
  const YakPayoutState({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return YakBadge(label: status, variant: YakBadgeVariant.primary);
  }
}

class YakPayoutExpand extends StatelessWidget {
  const YakPayoutExpand({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return YakDetailExpand(title: title, child: child);
  }
}

class YakTransferStatus extends StatelessWidget {
  const YakTransferStatus({super.key, required this.status, this.amount});

  final String status;
  final String? amount;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YakBadge(label: status),
          if (amount != null) Text(amount!, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}

class YakProcessStatus extends StatelessWidget {
  const YakProcessStatus({super.key, required this.step, required this.total});

  final int step;
  final int total;

  @override
  Widget build(BuildContext context) {
    return YakSteps(
      steps: List.generate(total, (i) => 'Step ${i + 1}'),
      currentStep: step,
    );
  }
}

class YakProcessCard extends StatelessWidget {
  const YakProcessCard({super.key, required this.title, required this.step, required this.total});

  final String title;
  final int step;
  final int total;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          YakProcessStatus(step: step, total: total),
        ],
      ),
    );
  }
}

class YakDocumentState extends StatelessWidget {
  const YakDocumentState({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return YakBadge(label: status, variant: YakBadgeVariant.warning);
  }
}

class YakDocumentActionItem extends StatelessWidget {
  const YakDocumentActionItem({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YakActionItem(title: title, icon: Icons.description_outlined, onTap: onTap);
  }
}

class YakConfirmDelegate extends StatelessWidget {
  const YakConfirmDelegate({super.key, required this.name, this.onConfirm});

  final String name;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      onTap: onConfirm,
      child: Text('Confirm delegate: $name'),
    );
  }
}

class YakIncentive extends StatelessWidget {
  const YakIncentive({super.key, required this.title, required this.reward});

  final String title;
  final String reward;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(
      child: Row(
        children: [
          Expanded(child: Text(title)),
          YakBadge(label: reward, variant: YakBadgeVariant.success),
        ],
      ),
    );
  }
}

class YakReferralBonus extends StatelessWidget {
  const YakReferralBonus({super.key, required this.amount});

  final String amount;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(child: Text('Referral bonus: $amount'));
  }
}

class YakReferralCodeCard extends StatelessWidget {
  const YakReferralCodeCard({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return YakDomainCard(child: Text('Code: $code', style: Theme.of(context).textTheme.titleMedium));
  }
}

class YakCreditBannerBalance extends StatelessWidget {
  const YakCreditBannerBalance({super.key, required this.balance});

  final String balance;

  @override
  Widget build(BuildContext context) {
    return YakBanner(title: 'Credit balance', message: balance);
  }
}

class YakUserCommentCard extends StatelessWidget {
  const YakUserCommentCard({super.key, required this.author, required this.comment});

  final String author;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return YakCardMessage(title: author, message: comment);
  }
}

class YakResultState extends StatelessWidget {
  const YakResultState({
    super.key,
    required this.title,
    this.message,
    this.isSuccess = true,
  });

  final String title;
  final String? message;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    final yakTheme = context.yakTheme;
    return YakDomainCard(
      child: Column(
        children: [
          Icon(
            isSuccess ? Icons.check_circle_outline : Icons.error_outline,
            size: 48,
            color: isSuccess ? yakTheme.success : yakTheme.danger,
          ),
          SizedBox(height: yakTheme.spacingSm),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (message != null) Text(message!),
        ],
      ),
    );
  }
}
