import 'package:firebase_auth/firebase_auth.dart';

import '../../core/helpers/encrypt_helper.dart';
import '../../core/models/simple_result.dart';
import '../constants/auth_constants.dart';
import '../constants/error_constants.dart';
import '../models/user/user_data.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class AuthHelper {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  SimpleResult<User> getAuth() {
    return _authService.getAuth();
  }

  Future<SimpleResult<UserData>> signInWithEmail({required String email, required String password}) async {
    try {
      var authResponse = await _authService.signInWithEmail(email: email, password: password);

      if (!authResponse.isSuccess) {
        return SimpleResult(
            isSuccess: false, errorType: authResponse.errorType, errorMessage: authResponse.errorMessage);
      }

      return await _userService.getUser(userId: authResponse.data!.uid);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorType: ErrorTypes.unknown);
    }
  }

  Future<SimpleResult<UserData>> signUpWithEmail({required String email, required String password}) async {
    try {
      var authResponse = await _authService.signUpWithEmail(email: email, password: password);

      if (!authResponse.isSuccess) {
        return SimpleResult(
            isSuccess: false, errorType: authResponse.errorType, errorMessage: authResponse.errorMessage);
      }

      var userData = UserData(
          authId: authResponse.data!.uid,
          authType: AuthTypes.email.index,
          emailAddress: email,
          password: EncryptHelper.encryptAES(password));

      await _userService.writeUser(userId: authResponse.data!.uid, userData: userData);

      return await _userService.getUser(userId: authResponse.data!.uid);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorType: ErrorTypes.unknown);
    }
  }

  Future<SimpleResult> signOut() async {
    var firebaseResponse = await _authService.signOut();
    return firebaseResponse;
  }
}
