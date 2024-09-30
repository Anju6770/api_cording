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
            Container(
                height: MediaQuery.of(context).size.height*0.99,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/image/sp.jpg"),fit: BoxFit.cover,)
                ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()),
                ],
              ),
                ),
          ],
        ),
      ),
    );
  }
}
