import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remindly/core/models/simple_result.dart';
import 'package:remindly/product/services/auth_service.dart';

import '../../models/user/user_data.dart';

class UserContext with ChangeNotifier {
  final BuildContext context;
  User? authUser;
  UserData? userData;
  AuthService _authService = AuthService();

  UserContext(this.context);

  Future<void> signUp(
      {required String realName,
      required String email,
      required String password}) async {
    print("$realName, $email, $password");

    var response = await _authService.signUp(
        realName: realName, email: email, password: password);

    print(response.data?.uid);
  }

  Future<void> signIn({required String email, required String password}) async {
    var response = await _authService.signIn(email: email, password: password);

    print(response.data?.uid);
  }
}
