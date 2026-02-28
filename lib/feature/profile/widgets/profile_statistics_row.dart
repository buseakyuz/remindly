import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';

class ProfileStatisticsRow extends StatelessWidget {
  final String noteCount;
  final String joinDate;

  const ProfileStatisticsRow({
    super.key,
    required this.noteCount,
    required this.joinDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ProfileStatItem(
          title: noteCount,
          subtitle: LocaleKeys.profile_reminder_note.tr(),
        ),
        _ProfileStatItem(
          title: joinDate,
          subtitle: LocaleKeys.profile_joined_date.tr(),
        ),
      ],
    );
  }
}

class _ProfileStatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ProfileStatItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
