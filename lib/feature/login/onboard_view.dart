import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remindly/core/constants/layout_constants.dart';
import 'package:remindly/feature/login/sign_up_view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _onboardingIcon(),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(LayoutConstants.largeSize),
            ),
          ),
          margin: EdgeInsets.zero,
          color: Colors.black,
          child: Container(
            width: double.infinity,
            child: SafeArea(
                top: false,
                child: Padding(
                  padding: LayoutConstants.highAllPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LayoutConstants.highEmptyHeight,
                      _welcomeText(),
                      LayoutConstants.largeEmptyHeight,
                      _customRectangleButton(context),
                      LayoutConstants.highEmptyHeight,
                    ],
                  ),
                )),
          ),
        )
      ]),
    );
  }

  Expanded _onboardingIcon() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/images/remindnote.png"),
        ],
      ),
    );
  }

  Column _welcomeText() {
    return Column(
      children: [
        Text(
          "Geleceğe Not Bırak ",
          style: TextStyle(
              color: Colors.white, fontSize: 44.0, fontWeight: FontWeight.bold),
        ),
        LayoutConstants.centralEmptyHeight,
        Text(
          "Notunu oluştur, hatırlatalım.",
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ],
    );
  }

  GestureDetector _customRectangleButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignUpView()));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Text("Hadi Başlayalım",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0))),
        ),
      ),
    );
  }

  Column onboardIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset("assets/images/remindnote.png"),
      ],
    );
  }
}
