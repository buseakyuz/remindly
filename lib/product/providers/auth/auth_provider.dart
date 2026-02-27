import 'package:flutter/material.dart';

enum AuthState { idle, registeringEmail, loggingEmail }

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.idle;

  AuthProvider(BuildContext context);
  AuthState get state => _state;

  set state(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
