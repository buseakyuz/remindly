import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:remindly/product/navigation/app_router.dart';
import 'package:remindly/product/providers/note/note_provider.dart';
import 'product/init/application_init.dart';
import 'product/init/product_states.dart';
import 'product/init/theme_manager.dart';

void main() async {
  final appInit = ApplicationInit();
  await appInit.firstlyInit();

  runApp(
    Phoenix(
      child: EasyLocalization(
        fallbackLocale: appInit.manager.enLocale,
        supportedLocales: appInit.manager.supportLocales,
        path: appInit.assetPath,
        child: MultiProvider(
          providers: ProductProvider().items,
          child: _MyApp(),
        ),
      ),
    ),
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        title: 'Remindly',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: context.watch<ThemeManager>().currentTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
