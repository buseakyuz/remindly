import '../constants/error_constants.dart';

abstract class ErrorCatcher {
  static ErrorTypes catchFirebaseError(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return ErrorTypes.weakPassword;
      case 'email-already-in-use':
        return ErrorTypes.emailAlreadyInUse;
      case 'wrong-password':
        return ErrorTypes.wrongPassword;
      case 'account-exists-with-different-credential':
        return ErrorTypes.accountExistsDifferentCredential;
      case 'user-not-found':
        return ErrorTypes.userNotFoundFromAuth;
      case 'too-many-requests':
        return ErrorTypes.tooManyRequests;
      default:
        return ErrorTypes.unknown;
    }
  }
}
