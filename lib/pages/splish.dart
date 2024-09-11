import 'dart:async';
import 'package:api_cording/pages/wall_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Get.offAll(() => WallHome())
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:Column(
          children: [
            Image(image: AssetImage("assets/image/sp.jpg")),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
