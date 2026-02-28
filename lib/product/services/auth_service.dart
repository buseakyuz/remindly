import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/simple_result.dart';
import '../constants/error_constants.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SimpleResult<User>> signUp(
      {required String realName,
      required String email,
      required String password}) async {
    try {
      var response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await response.user?.updateDisplayName(realName);

      // Refresh the user to get the updated displayName
      await response.user?.reload();
      final updatedUser = _auth.currentUser;

      return SimpleResult(isSuccess: true, data: updatedUser);
    } on FirebaseAuthException catch (e) {
      final errorType = _mapFirebaseError(e.code);
      return SimpleResult(
          isSuccess: false,
          errorType: errorType,
          errorMessage: errorType.toLocaleMessage);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<SimpleResult<User>> signIn(
      {required String email, required String password}) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return SimpleResult(isSuccess: true, data: response.user);
    } on FirebaseAuthException catch (e) {
      final errorType = _mapFirebaseError(e.code);
      return SimpleResult(
          isSuccess: false,
          errorType: errorType,
          errorMessage: errorType.toLocaleMessage);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<SimpleResult<void>> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return SimpleResult(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      final errorType = _mapFirebaseError(e.code);
      return SimpleResult(
          isSuccess: false,
          errorType: errorType,
          errorMessage: errorType.toLocaleMessage);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  ErrorTypes _mapFirebaseError(String code) {
    switch (code) {
      case 'user-not-found':
        return ErrorTypes.userNotFoundFromAuth;
      case 'wrong-password':
      case 'invalid-credential':
        return ErrorTypes.wrongPassword;
      case 'weak-password':
        return ErrorTypes.weakPassword;
      case 'email-already-in-use':
        return ErrorTypes.emailAlreadyInUse;
      case 'too-many-requests':
        return ErrorTypes.tooManyRequests;
      case 'account-exists-with-different-credential':
        return ErrorTypes.accountExistsDifferentCredential;
      default:
        return ErrorTypes.unknown;
    }
  }
}
