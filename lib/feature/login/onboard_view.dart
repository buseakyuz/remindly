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
                      _buildCustomRectangleButton(context),
                      LayoutConstants.highEmptyHeight,
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildOnboardingIcon() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/images/remindnote.png"),
        ],
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

  GestureDetector _buildCustomRectangleButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.signUp.path);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: LayoutConstants.midSize,
            horizontal: LayoutConstants.defaultSize,
          ),
          child: Center(
            child: Text(
              LocaleKeys.login_lets_start.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
