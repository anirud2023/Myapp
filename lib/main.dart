import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Pages/home_page.dart';
import 'package:myapp/Pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/login_page.dart';
import 'Pages/route_navigation.dart';

void main() {
  runApp(MyApp());
}
class SplashScreenController extends GetxController {

  static String Keylogin="login";

  Future<void> whereToGo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isLoggedIn = sharedPreferences.getBool(Keylogin);

    Future.delayed(Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Get.off(HomePage());
        } else {
          Get.off(LoginPage());
        }
      } else {
        Get.off(LoginPage());
      }
    });
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Login Page Example',
      home: SplashScreen(),
      getPages: RoutNav.routes,
      // Set the initial page to the login page
    );
  }
}



