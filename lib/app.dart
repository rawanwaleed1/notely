import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/themes/light_theme.dart';
import 'generated/locale_keys.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: LocaleKeys.app_name.tr(),
      theme: LightTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}