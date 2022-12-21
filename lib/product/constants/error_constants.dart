import 'package:easy_localization/easy_localization.dart';

import '../lang/locale_keys.g.dart';

enum ErrorTypes {
  unknown,
  userAlreadyWrited,
  accountExistsDifferentCredential,
  userNotFoundFromDB,
  weakPassword,
  emailAlreadyInUse,
  wrongPassword,
  userNotFoundFromAuth,
  tooManyRequests,
  emailNotCatch
}

extension ErrorTypesLocalization on ErrorTypes {
  String get toLocaleMessage {
    switch (this) {
      case ErrorTypes.unknown:
        return LocaleKeys.error_unknown.tr();
      case ErrorTypes.userAlreadyWrited:
        return LocaleKeys.error_userAlreadyWrited.tr();
      case ErrorTypes.accountExistsDifferentCredential:
        return LocaleKeys.error_accountExistsDifferentCredential.tr();
      case ErrorTypes.userNotFoundFromDB:
        return LocaleKeys.error_userNotFound.tr();
      case ErrorTypes.weakPassword:
        return LocaleKeys.error_weakPassword.tr();
      case ErrorTypes.emailAlreadyInUse:
        return LocaleKeys.error_emailAlreadyInUse.tr();
      case ErrorTypes.wrongPassword:
        return LocaleKeys.error_wrongPassword.tr();
      case ErrorTypes.userNotFoundFromAuth:
        return LocaleKeys.error_userNotFound.tr();
      case ErrorTypes.tooManyRequests:
        return LocaleKeys.error_tooManyRequests.tr();
      case ErrorTypes.emailNotCatch:
        return LocaleKeys.error_emailNotCatch.tr();
    }
  }
}
