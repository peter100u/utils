import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAppWidget extends StatelessWidget {
  final List<GetPage>? getPages;
  final Translations? translations;
  final String? initialRoute;
  final String title;
  final Locale? locale;
  final Locale? fallbackLocale;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode themeMode;

  const GetAppWidget({super.key, this.getPages, this.translations, this.initialRoute,
    this.title = '', this.locale, this.fallbackLocale, this.darkTheme, this.themeMode = ThemeMode.system, this.theme});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      translations: translations,
      locale: locale,
      theme: theme,
      darkTheme: darkTheme,
      fallbackLocale: fallbackLocale ?? const Locale('en', 'US'),
      getPages: getPages,
      themeMode: themeMode,
      defaultTransition: Transition.cupertino,
      title: 'app_title'.tr,
    );
  }
}
