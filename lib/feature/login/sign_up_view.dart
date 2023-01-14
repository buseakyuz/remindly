import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remindly/feature/login/sign_in_view.dart';

import '../../core/constants/layout_constants.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                  Navigator.pop(context);
                },
              ),
              LayoutConstants.ultraEmptyHeight,
              _pageTitle(),
              LayoutConstants.maxEmptyHeight,
              _customTextField(label: "İsim Soyisim", iconData: Icons.person),
              LayoutConstants.highEmptyHeight,
              _customTextField(
                  label: "E-Posta", iconData: Icons.alternate_email),
              LayoutConstants.highEmptyHeight,
              _customTextField(label: "Parola", iconData: Icons.lock),
              LayoutConstants.highEmptyHeight,
              customRectangleButton(),
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
                                .bodyText1!
                                .copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 22.0)),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignInView()),
                              );
                            },
                          text: " Giriş Yap.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
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
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 20.0)),
            TextSpan(
                text: " kabul ettiğinizi onaylarsınız.",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20.0,
                      color: Colors.black.withOpacity(0.5),
                    )),
          ],
          text: "Devam ederek",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20.0,
                color: Colors.black.withOpacity(0.5),
              )),
    );
  }

  Container customRectangleButton() {
    return Container(
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
                  color: Colors.black.withOpacity(0.5), fontSize: 18.0)),
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
      {required String label, required IconData iconData}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.defaultSize,
            vertical: LayoutConstants.lowSize),
        child: TextField(
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
}
