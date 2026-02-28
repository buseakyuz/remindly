import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/navigation/route_enums.dart';
import 'package:remindly/product/providers/user/user_context.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';
import 'package:remindly/feature/global/widgets/dialog/custom_error_dialog.dart';

import 'widgets/login_text_field.dart';
import 'widgets/login_action_button.dart';
import 'widgets/login_header.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController realNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    _setLoading(true);

    final result = await context.read<UserContext>().signUp(
          realName: realNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

    _setLoading(false);

    if (!mounted) return;

    if (result.isSuccess) {
      context.go(AppRoutes.home.path);
    } else {
      CustomErrorDialog(context).show(
        title: LocaleKeys.dialog_auth_error.tr(),
        description: result.errorMessage ?? LocaleKeys.error_unknown.tr(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: LayoutConstants.largeAllPadding,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeader(
                    title: LocaleKeys.login_sign_up_title.tr(),
                    subtitle: LocaleKeys.login_sign_up_subtitle.tr(),
                  ),
                  LayoutConstants.ultraEmptyHeight,
                  LoginTextField(
                    label: LocaleKeys.login_name_surname.tr(),
                    iconData: Icons.person,
                    controller: realNameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    validator: (val) => val != null && val.isNotEmpty
                        ? null
                        : "Lütfen isminizi giriniz.",
                  ),
                  LayoutConstants.highEmptyHeight,
                  LoginTextField(
                    label: LocaleKeys.login_email.tr(),
                    iconData: Icons.alternate_email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val != null && val.contains('@')
                        ? null
                        : LocaleKeys.form_enter_a_valid_mail.tr(),
                  ),
                  LayoutConstants.highEmptyHeight,
                  LoginTextField(
                    label: LocaleKeys.login_password.tr(),
                    iconData: Icons.lock,
                    controller: passwordController,
                    isPassword: true,
                    validator: (val) => val != null && val.length >= 6
                        ? null
                        : LocaleKeys.form_password_must_be_long_character.tr(),
                  ),
                  LayoutConstants.ultraEmptyHeight,
                  LoginActionButton(
                    label: LocaleKeys.login_sign_up.tr(),
                    onTap: _signUp,
                    isLoading: _isLoading,
                  ),
                  LayoutConstants.highEmptyHeight,
                  Center(child: _privacyPolicy()),
                  LayoutConstants.highEmptyHeight,
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              "${LocaleKeys.login_already_have_account.tr()} ",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurface
                                .withValues(alpha: 0.5),
                            fontSize: 18.0,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(AppRoutes.signIn.path);
                            },
                          text: LocaleKeys.login_sign_in.tr(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.primary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText _privacyPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: LocaleKeys.login_privacy_policy_1.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 16.0,
            ),
          ),
          TextSpan(
            text: LocaleKeys.login_privacy_policy_2.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          TextSpan(
            text: LocaleKeys.login_privacy_policy_3.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
