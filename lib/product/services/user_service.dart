import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/simple_result.dart';
import '../constants/error_constants.dart';
import '../models/user/user_data.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SimpleResult<UserData>> getUserData(String authId) async {
    try {
      final doc = await _firestore.collection('users').doc(authId).get();
      if (doc.exists && doc.data() != null) {
        return SimpleResult(
          isSuccess: true,
          data: UserData.fromJson(doc.data()!),
        );
      }
      return SimpleResult(
        isSuccess: false,
        errorType: ErrorTypes.userNotFoundFromDB,
      );
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<SimpleResult<void>> createUserData(UserData userModel) async {
    try {
      await _firestore
          .collection('users')
          .doc(userModel.authId)
          .set(userModel.toJson())
          .timeout(const Duration(seconds: 10));
      return SimpleResult(isSuccess: true);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }
}
