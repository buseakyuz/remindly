import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/simple_result.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SimpleResult<User>> signUp(
      {required String realName,
      required String email,
      required String password}) async {
    try {
      var response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return SimpleResult(isSuccess: true, data: response.user);
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
    } catch (e) {
      print(e.toString());
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }
}
