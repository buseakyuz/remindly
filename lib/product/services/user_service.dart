import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/simple_result.dart';
import '../constants/database_constants.dart';
import '../constants/error_constants.dart';
import '../models/user/user_data.dart';

abstract class IUserService {
  Future<SimpleResult> writeUser({required String userId, required UserData userData});
  Future<SimpleResult<UserData>> getUser({required String userId});
}

class UserService extends IUserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<SimpleResult> writeUser({required String userId, required UserData userData}) async {
    try {
      var userMap = userData.toJson();
      userMap['createDate'] = FieldValue.serverTimestamp();

      await _firestore.collection(DatabaseFields.users.rawValue).doc(userId).set(userMap);
      return SimpleResult(isSuccess: true);
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }

  @override
  Future<SimpleResult<UserData>> getUser({required String userId}) async {
    try {
      var response = await _firestore.collection(DatabaseFields.users.rawValue).doc(userId).get();

      if (!response.exists) {
        return SimpleResult(isSuccess: false, errorType: ErrorTypes.userNotFoundFromDB);
      }

      return SimpleResult(isSuccess: true, data: UserData.fromJson(response.data()!));
    } catch (e) {
      return SimpleResult(isSuccess: false, errorMessage: e.toString());
    }
  }
}
