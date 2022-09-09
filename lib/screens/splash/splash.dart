import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
}
