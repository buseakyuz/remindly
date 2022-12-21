import 'package:flutter/material.dart';

import 'feature/login/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remindly',
      home: LoginView(),
    );
  }
}
