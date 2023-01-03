import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 64.0,
              ),
              _pageTitle(),
              SizedBox(
                height: 48.0,
              ),
              _customTextField(
                  label: "E-Posta", iconData: Icons.alternate_email),
              const SizedBox(height: 24.0),
              _customTextField(label: "Parola", iconData: Icons.lock),
              const SizedBox(
                height: 24.0,
              ),
              customRectangleButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container customRectangleButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
          padding: const EdgeInsets.all(4.0),
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
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
