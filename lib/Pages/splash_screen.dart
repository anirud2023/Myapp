import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Pages/home_page.dart';
import 'package:myapp/Pages/login_page.dart';
import 'package:myapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget{
final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    controller.whereToGo();

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'My App',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

