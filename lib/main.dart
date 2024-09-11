import 'package:api_cording/pages/home.dart';
import 'package:api_cording/pages/people_home.dart';
import 'package:api_cording/pages/splish.dart';
import 'package:api_cording/pages/wall_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splish',
      getPages: [
        GetPage(name: '/home', page: ()=> WallHome()),
        GetPage(name: '/people', page: ()=> PeopleHome()),
        GetPage(name: '/splish', page: ()=> SplashScreen()),
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: WallHome(),
    );
  }
}