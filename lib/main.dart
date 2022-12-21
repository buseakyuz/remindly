import 'package:flutter/material.dart';

import 'feature/login/login_view.dart';
import 'feature/login/onboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remindly',
      home: OnboardView(),
    );
  }
}
