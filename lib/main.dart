import 'package:flutter/material.dart';
import 'package:suitmedia_submission/shared/theme.dart';
import 'package:get/get.dart';
import 'package:suitmedia_submission/ui/pages/first_screen_page.dart';
import 'package:suitmedia_submission/ui/pages/second_screen_page.dart';
import 'package:suitmedia_submission/ui/pages/third_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
         appBarTheme: AppBarTheme(
            elevation: 0.4,
            centerTitle: true,
            backgroundColor: whiteColor,
            toolbarHeight: 64,

            iconTheme: IconThemeData(
              size: 30,
              color: purpleColor
            ),

            titleTextStyle: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold
            ),
          ),
      ),

      getPages: [
        GetPage(name: '/', page: () => const FirstScreenPage()),
        GetPage(name: '/second', page: () => SecondScreenPage(userWelcomeName: Get.arguments)),
        GetPage(name: '/third', page: () => const ThirdScreenPage()),
      ],

      initialRoute: '/',
    );
  }
}

