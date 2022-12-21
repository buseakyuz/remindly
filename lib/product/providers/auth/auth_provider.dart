import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

import '../../../feature/global/widgets/dialog/custom_error_dialog.dart';
import '../../constants/error_constants.dart';
import '../../helpers/auth_helper.dart';
import '../../lang/locale_keys.g.dart';
import '../../models/user/user_data.dart';
import '../user/user_context.dart';

enum AuthState { idle, registeringEmail, loggingEmail }

enum SocialLoginType { facebook, twitter, google, apple }

class AuthProvider with ChangeNotifier {
  final AuthHelper _authHelper = AuthHelper();
  AuthState _state = AuthState.idle;

  AuthProvider(BuildContext context) {
    _checkAuthState(context);
  }
  AuthState get state => _state;

  set state(AuthState state) {
    _state = state;
    notifyListeners();
  }

  void _checkAuthState(BuildContext context) {
    var authResponse = _authHelper.getAuth();
    if (authResponse.isSuccess) {
      context.read<UserContext>().authUser = authResponse.data;
    } else {
      //HATA MESAJI GÖSTERECEZ
    }
  }

  Future<void> signInWithEmail({required BuildContext context, required String email, required String password}) async {
    state = AuthState.loggingEmail;
    var response = await _authHelper.signInWithEmail(email: email, password: password);

    if (response.isSuccess) {
      _gotoBasePage(context, response.data);
    } else {
      _showError(context, response.errorType, response.errorMessage);
      print('HATA : ${response.errorType}, ${response.errorMessage}');
    }

    state = AuthState.idle;
  }

  Future<void> signUpWithEmail({required BuildContext context, required String email, required String password}) async {
    state = AuthState.registeringEmail;
    var response = await _authHelper.signUpWithEmail(email: email, password: password);

    if (response.isSuccess) {
      _gotoBasePage(context, response.data);
    } else {
      //HATA MESAJINI GÖSTERECEZ
      print('HATA : ${response.errorType}');
    }

    state = AuthState.idle;
  }

  void _showError(BuildContext context, ErrorTypes errorType, String? errorMessage) {
    print(errorType);
    CustomErrorDialog(context).show(title: LocaleKeys.dialog_auth_error.tr(), description: errorType.toLocaleMessage);
  }

  void signOut(BuildContext context) async {
    await _authHelper.signOut();
    Phoenix.rebirth(context);
  }

  void _gotoBasePage(BuildContext context, UserData? data) {
    context.read<UserContext>().userData = data;
    //TODO: Ana Sayfaya Gidiş
    //context.read<NavigationService>().navigateToPageClear(path: NavigationEnums.base.rawValue);
  }
}
