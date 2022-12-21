import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/simple_result.dart';
import '../helpers/error_catcher.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  SimpleResult<User> getAuth() {
    try {
      var response = _firebaseAuth.currentUser;
      return SimpleResult(isSuccess: true, data: response);
    } catch (e) {
      return SimpleResult(isSuccess: false);
    }
  }

  Future<SimpleResult<User>> signUpWithEmail({required String email, required String password}) async {
    try {
      var response = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return SimpleResult(isSuccess: true, data: response.user!);
    } on FirebaseAuthException catch (e) {
      return SimpleResult(
          isSuccess: false, errorType: ErrorCatcher.catchFirebaseError(e.code), errorMessage: e.message);
    } catch (e) {
      return SimpleResult(isSuccess: false);
    }
  }

  Future<SimpleResult<User>> signInWithEmail({required String email, required String password}) async {
    try {
      var response = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return SimpleResult(isSuccess: true, data: response.user!);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return SimpleResult(
          isSuccess: false, errorType: ErrorCatcher.catchFirebaseError(e.code), errorMessage: e.message);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<SimpleResult> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return SimpleResult(isSuccess: true);
    } catch (e) {
      print(e);
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<SimpleResult> deleteUser() async {
    try {
      await _firebaseAuth.currentUser!.delete();
      return SimpleResult(isSuccess: true);
    } catch (e) {
      print(e);
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }
}
