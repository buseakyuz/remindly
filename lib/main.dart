import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:remindly/feature/login/onboard_view.dart';
import 'package:remindly/feature/login/sign_in_view.dart';
import 'package:remindly/product/providers/note/note_provider.dart';

import 'feature/home/home_view.dart';
import 'feature/login/sign_up_view.dart';
import 'product/init/application_init.dart';
import 'product/init/product_states.dart';
import 'product/init/theme_manager.dart';

void main() async {
  final _appInit = ApplicationInit();
  await _appInit.firstlyInit();

  runApp(
    Phoenix(
      child: EasyLocalization(
        fallbackLocale: _appInit.manager.enLocale,
        supportedLocales: _appInit.manager.supportLocales,
        path: _appInit.assetPath,
        child: MultiProvider(
          providers: ProductProvider().items,
          child: _MyApp(),
        ),
      ),
    ),
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        title: 'Remindly',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: context.watch<ThemeManager>().currentTheme,
        home: OnboardView(),
      ),
    );
  }
}
