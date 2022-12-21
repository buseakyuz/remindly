import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../firebase_options.dart';
import 'language_manager.dart';
import 'shared_manager.dart';
import 'timezone_init.dart';

class ApplicationInit {
  final String assetPath = 'assets/lang';
  final LanguageManager manager = LanguageManager.instance;
  Future<void> start() async {
    await SharedManager.instance.initSharedManager();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    EasyLocalization.logger.enableLevels = [];
  }

  Future<void> firstlyInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseAppCheck.instance.activate();
    await EasyLocalization.ensureInitialized();
    TimezoneInit().init();
    SharedManager.instance.initSharedManager();
  }
}
