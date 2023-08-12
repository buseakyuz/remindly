import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../feature/global/widgets/dialog/custom_error_dialog.dart';
import '../../constants/error_constants.dart';

import '../../lang/locale_keys.g.dart';
import '../../models/user/user_data.dart';
import '../user/user_context.dart';

enum AuthState { idle, registeringEmail, loggingEmail }

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.idle;

  AuthProvider(BuildContext context) {}
  AuthState get state => _state;

  set state(AuthState state) {
    _state = state;
    notifyListeners();
  }

  void _showError(
      BuildContext context, ErrorTypes errorType, String? errorMessage) {
    print(errorType);
    CustomErrorDialog(context).show(
        title: LocaleKeys.dialog_auth_error.tr(),
        description: errorType.toLocaleMessage);
  }

  void _gotoBasePage(BuildContext context, UserData? data) {
    context.read<UserContext>().userData = data;
    //TODO: Ana Sayfaya Gidiş
    //context.read<NavigationService>().navigateToPageClear(path: NavigationEnums.base.rawValue);
  }
}
