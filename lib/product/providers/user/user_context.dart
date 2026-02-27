import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remindly/product/services/auth_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user/user_data.dart';

class UserContext with ChangeNotifier {
  final BuildContext context;
  User? authUser;
  UserData? userData;
  final AuthService _authService = AuthService();

  String _avatarPath = "assets/avatars/0.png";
  String get avatarPath => _avatarPath;

  UserContext(this.context) {
    _loadAvatar();
  }

  Future<void> _loadAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    _avatarPath = prefs.getString('avatarPath') ?? "assets/avatars/0.png";
    notifyListeners();
  }

  Future<void> updateAvatar(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatarPath', path);
    _avatarPath = path;
    notifyListeners();
  }

  Future<void> signUp(
      {required String realName,
      required String email,
      required String password}) async {
    await _authService.signUp(
        realName: realName, email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await _authService.signIn(email: email, password: password);
  }
}
