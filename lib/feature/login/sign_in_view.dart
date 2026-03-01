import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';
import 'package:remindly/product/lang/locale_keys.g.dart';
import 'package:remindly/product/providers/user/user_context.dart';
import 'package:remindly/feature/global/widgets/dialog/custom_error_dialog.dart';

import 'widgets/login_text_field.dart';
import 'widgets/login_action_button.dart';
import 'widgets/login_header.dart';
import '../../../product/navigation/route_enums.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  Future<void> signIn() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    _setLoading(true);

    final result = await context.read<UserContext>().signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
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

  Future<void> _showForgotPasswordDialog() async {
    final emailController = TextEditingController();
    bool emailSent = false;

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            if (emailSent) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    LayoutConstants.defaultRadius,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LayoutConstants.defaultEmptyHeight,
                    Icon(
                      Icons.mark_email_read_outlined,
                      size: 64,
                      color: context.colorScheme.primary,
                    ),
                    LayoutConstants.defaultEmptyHeight,
                    Text(
                      LocaleKeys.login_password_reset_sent.tr(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    LayoutConstants.defaultEmptyHeight,
                  ],
                ),
              );
            }

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  LayoutConstants.defaultRadius,
                ),
              ),
              title: Text(
                LocaleKeys.login_forgot_password.tr(),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(LocaleKeys.login_forgot_password_desc.tr()),
                  LayoutConstants.defaultEmptyHeight,
                  LoginTextField(
                    label: LocaleKeys.login_email.tr(),
                    iconData: Icons.alternate_email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => dialogContext.pop(),
                  child: Text(LocaleKeys.profile_logout_cancel.tr()),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = emailController.text.trim();
                    if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            LocaleKeys.form_enter_a_valid_mail.tr(),
                          ),
                        ),
                      );
                      return;
                    }

                    final result = await context
                        .read<UserContext>()
                        .resetPassword(email: email);

                    if (!mounted) return;

                    if (result.isSuccess) {
                      setDialogState(() => emailSent = true);
                      await Future.delayed(const Duration(seconds: 2));
                      if (dialogContext.mounted) dialogContext.pop();
                    } else {
                      if (dialogContext.mounted) dialogContext.pop();
                      CustomErrorDialog(context).show(
                        title: LocaleKeys.dialog_auth_error.tr(),
                        description:
                            result.errorMessage ??
                            LocaleKeys.error_unknown.tr(),
                      );
                    }
                  },
                  child: Text(LocaleKeys.login_send.tr()),
                ),
              ],
            );
          },
        );
      },
    );
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
                    title: LocaleKeys.login_sign_in.tr(),
                    subtitle: LocaleKeys.login_sign_in_subtitle.tr(),
                  ),
                  LayoutConstants.maxEmptyHeight,
                  LoginTextField(
                    label: LocaleKeys.login_email.tr(),
                    iconData: Icons.alternate_email,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val != null && val.contains('@')
                        ? null
                        : LocaleKeys.form_enter_a_valid_mail.tr(),
                  ),
                  LayoutConstants.highEmptyHeight,
                  LoginTextField(
                    label: LocaleKeys.login_password.tr(),
                    iconData: Icons.lock,
                    controller: _passwordController,
                    isPassword: true,
                    validator: (val) => val != null && val.length >= 6
                        ? null
                        : LocaleKeys.form_password_must_be_long_character.tr(),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _showForgotPasswordDialog,
                      child: Text(
                        LocaleKeys.login_forgot_password.tr(),
                        style: TextStyle(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  LayoutConstants.defaultEmptyHeight,
                  LoginActionButton(
                    label: LocaleKeys.login_sign_in.tr(),
                    onTap: signIn,
                    isLoading: _isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
