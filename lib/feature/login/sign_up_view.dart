import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:remindly/product/navigation/route_enums.dart';
import 'package:remindly/product/providers/user/user_context.dart';

import '../../core/constants/layout_constants.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController realNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: LayoutConstants.largeAllPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(
                onTap: () {
                  context.pop();
                },
              ),
              LayoutConstants.ultraEmptyHeight,
              _pageTitle(),
              LayoutConstants.maxEmptyHeight,
              _customTextField(
                  label: "İsim Soyisim",
                  iconData: Icons.person,
                  controller: realNameController),
              LayoutConstants.highEmptyHeight,
              _customTextField(
                  label: "E-Posta",
                  iconData: Icons.alternate_email,
                  controller: emailController),
              LayoutConstants.highEmptyHeight,
              _customTextField(
                  label: "Parola",
                  iconData: Icons.lock,
                  controller: passwordController),
              LayoutConstants.highEmptyHeight,
              signUpButton(),
              LayoutConstants.highEmptyHeight,
              _privacyPolicy(),
              LayoutConstants.highEmptyHeight,
              Column(
                children: [
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Zaten bir hesabın var mı?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    fontSize: 22.0)),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(AppRoutes.signIn.path);
                            },
                          text: " Giriş Yap.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  RichText _privacyPolicy() {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: " hüküm ve koşullarımızı",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black, fontSize: 20.0)),
            TextSpan(
                text: " kabul ettiğinizi onaylarsınız.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20.0,
                      color: Colors.black.withValues(alpha: 0.5),
                    )),
          ],
          text: "Devam ederek",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.0,
                color: Colors.black.withValues(alpha: 0.5),
              )),
    );
  }

  Widget signUpButton() {
    return GestureDetector(
      onTap: _singUp,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: LayoutConstants.midSize,
              horizontal: LayoutConstants.midSize),
          child: Center(
            child: Text(
              "Kayıt Ol",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          ),
        ),
      ),
    );
  }

  Column _pageTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hesap Oluştur",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        Padding(
          padding: LayoutConstants.defaultVerticalPadding,
          child: Text("Geleceğe Not Bırakmak İçin Hemen Kayıt Ol.",
              style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.5), fontSize: 18.0)),
        ),
      ],
    );
  }

  Widget backButton({required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(LayoutConstants.lowSize),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 32.0,
          ),
        ),
      ),
    );
  }

  Container _customTextField(
      {required String label,
      required IconData iconData,
      required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.defaultSize,
            vertical: LayoutConstants.lowSize),
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: Icon(iconData),
            hintText: label,
            hintStyle: TextStyle(),
          ),
        ),
      ),
    );
  }

  void _singUp() {
    context.read<UserContext>().signUp(
        realName: realNameController.text,
        email: emailController.text,
        password: passwordController.text);
  }
}
