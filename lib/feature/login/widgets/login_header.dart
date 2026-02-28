import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showBackButton;

  const LoginHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBackButton)
          GestureDetector(
            onTap: () => context.pop(),
            child: Card(
              color: context.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(LayoutConstants.defaultRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(LayoutConstants.lowRadius),
                child: Icon(
                  Icons.chevron_left,
                  color: context.colorScheme.onPrimary,
                  size: 32.0,
                ),
              ),
            ),
          ),
        if (showBackButton) LayoutConstants.largeEmptyHeight,
        Text(
          title,
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            subtitle,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
