import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remindly/product/services/auth_service.dart';
import 'package:remindly/product/services/user_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user/user_data.dart';
import '../../../core/models/simple_result.dart';

class UserContext with ChangeNotifier {
  final BuildContext context;
  User? authUser;
  UserData? userData;
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  String _avatarPath = "assets/avatars/0.png";
  String get avatarPath => _avatarPath;

  UserContext(this.context) {
    authUser = FirebaseAuth.instance.currentUser;
    _loadAvatar();
    if (authUser != null) {
      _fetchUserData();
    }
  }

  Future<void> _fetchUserData() async {
    if (authUser == null) return;
    final result = await _userService.getUserData(authUser!.uid);
    if (result.isSuccess) {
      userData = result.data;
      notifyListeners();
    }
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

  Future<SimpleResult<User>> signUp({
    required String realName,
    required String email,
    required String password,
  }) async {
    final result = await _authService.signUp(
        realName: realName, email: email, password: password);
    if (result.isSuccess && result.data != null) {
      authUser = result.data;
      final newUser = UserData(
        authId: authUser!.uid,
        authType: 1,
        emailAddress: email,
        password: password,
        realname: realName,
        createDate: DateTime.now(),
      );

      final dbResult = await _userService.createUserData(newUser);
      if (dbResult.isSuccess) {
        userData = newUser;
      }
      notifyListeners();
    }
    return result;
  }

  Future<SimpleResult<User>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _authService.signIn(email: email, password: password);
    if (result.isSuccess) {
      authUser = result.data;
      await _fetchUserData();
      notifyListeners();
    }
    return result;
  }

  Future<SimpleResult<void>> resetPassword({required String email}) async {
    return await _authService.resetPassword(email: email);
  }

  Future<void> logOut() async {
    await _authService.signOut();
    authUser = null;
    userData = null;
    notifyListeners();
  }
}
