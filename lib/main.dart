import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/themes.dart';
import 'package:template/routes/app_routes.dart';
import 'package:template/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyAppThemes.lightThemes,
        translations: TranslationsImplementation(), // Set Translations
        locale: Locale('en', 'US'), // Default Locale - English (US)
        fallbackLocale: Locale(
          'en',
          'US',
        ), // Fallback Locale if translation is not found
        initialRoute: RoutesName.foodScreen,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
