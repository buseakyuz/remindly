import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_data.dart';

class UserContext with ChangeNotifier {
  final BuildContext context;
  User? authUser;
  UserData? userData;

  UserContext(this.context);
}
