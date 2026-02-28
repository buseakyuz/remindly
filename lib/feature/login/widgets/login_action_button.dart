import 'package:flutter/material.dart';
import '../../../../core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';

class LoginActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const LoginActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: LayoutConstants.midSize,
            horizontal: LayoutConstants.defaultSize,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: context.colorScheme.onPrimary,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    label,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
