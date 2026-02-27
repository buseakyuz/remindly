import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/product/providers/user/user_context.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              LayoutConstants.largeEmptyHeight,
              _pageTitle(),
              LayoutConstants.maxEmptyHeight,
              _customTextField(
                  label: "E-Posta",
                  iconData: Icons.alternate_email,
                  controller: _emailController),
              LayoutConstants.highEmptyHeight,
              _customTextField(
                  label: "Parola",
                  iconData: Icons.lock,
                  controller: _passwordController),
              LayoutConstants.highEmptyHeight,
              signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInButton() {
    return GestureDetector(
      onTap: signIn,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: LayoutConstants.midSize,
              horizontal: LayoutConstants.defaultSize),
          child: Center(
            child: Text(
              "Giriş Yap",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
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
          "Giriş Yap",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Geleceğe Not Bırakmak İçin Hemen Giriş Yap.",
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
          padding: const EdgeInsets.all(LayoutConstants.lowRadius),
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
        padding: const EdgeInsets.symmetric(
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

  void signIn() {
    context.read<UserContext>().signIn(
        email: _emailController.text, password: _passwordController.text);
  }
}
