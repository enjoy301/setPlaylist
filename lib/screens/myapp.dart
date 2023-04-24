import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/screens/splash/splash.dart';

import 'idol_list/idol_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ); // 초기 로딩 시 Splash Screen
        }
        // else if (snapshot.hasError) { return MaterialApp(home: ErrorScreen()); }
        else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: snapshot.data,
          );
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future<Widget?> initialize(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 3000));

    return const IdolListScreen(); // 초기 로딩 완료 시 띄울 앱 첫 화면
  }
}
