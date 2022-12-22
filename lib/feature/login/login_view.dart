import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              _customTextField(label: "İsim Soyisim", iconData: Icons.person),
              const SizedBox(height: 24.0),
              _customTextField(
                  label: "E-Posta", iconData: Icons.alternate_email),
              const SizedBox(height: 24.0),
              _customTextField(label: "Parola", iconData: Icons.lock),
              const SizedBox(
                height: 24.0,
              ),
              customRectangleButton(),
              SizedBox(
                height: 24.0,
              ),
              _privacyPolicy()
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
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Center(
          child: Text(
            "Kayıt Ol",
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
          "Hesap Oluştur",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Geleceğe Not Bırakmak İçin Kayıt Ol.",
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
