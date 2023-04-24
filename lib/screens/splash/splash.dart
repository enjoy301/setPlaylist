import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/screens/idol_list/idol_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/MyIdolController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF27282A),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 270),
                child: Image.asset(
                  "assets/images/splash_image.png",
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: const Text(
                  "셋플",
                  style: TextStyle(
                    fontFamily: 'Cafe24',
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: const Text(
                  "내맘대로\n드르륵 탁",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cafe24',
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _sharedPreferencesInit();
    _mustWaitTime();
  }

  _sharedPreferencesInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var controller = Get.put(MyIdolController());
    controller.loadMyIdolList(prefs.getString("idolList") ?? "");
  }

  // Warning: 위 로직이 끝나고 3초 뒤인지 확인 필요.
  _mustWaitTime() async {
    await Future.delayed(Duration(seconds: 3), () {
      Get.to(() => IdolListScreen());
    });
  }
}
