import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';
import 'package:remindly/product/navigation/route_enums.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildOnboardingIcon(),
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(LayoutConstants.largeSize),
              ),
            ),
            margin: EdgeInsets.zero,
            color: context.colorScheme.primary,
            child: SizedBox(
              width: double.infinity,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: LayoutConstants.highAllPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LayoutConstants.highEmptyHeight,
                      _buildWelcomeText(context),
                      LayoutConstants.largeEmptyHeight,
                      _buildAuthButtons(context),
                      LayoutConstants.highEmptyHeight,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildOnboardingIcon() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Image.asset("assets/images/remindnote.png")],
      ),
    );
  }

  Column _buildWelcomeText(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.login_welcome_title.tr(),
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        LayoutConstants.centralEmptyHeight,
        Text(
          LocaleKeys.login_welcome_subtitle.tr(),
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.surface,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAuthButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => context.push(AppRoutes.signIn.path),
            style: OutlinedButton.styleFrom(
              foregroundColor: context.colorScheme.surface,
              side: BorderSide(color: context.colorScheme.surface, width: 2),
              padding: const EdgeInsets.symmetric(
                vertical: LayoutConstants.midSize,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  LayoutConstants.defaultRadius,
                ),
              ),
            ),
            child: Text(
              LocaleKeys.login_sign_in.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.surface,
              ),
            ),
          ),
        ),
        const SizedBox(width: LayoutConstants.defaultSize),
        Expanded(
          child: ElevatedButton(
            onPressed: () => context.push(AppRoutes.signUp.path),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.surface,
              foregroundColor: context.colorScheme.primary,
              padding: const EdgeInsets.symmetric(
                vertical: LayoutConstants.midSize,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  LayoutConstants.defaultRadius,
                ),
              ),
            ),
            child: Text(
              LocaleKeys.login_sign_up.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
