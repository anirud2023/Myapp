import 'package:get/get.dart';
import 'home_page.dart';
import 'login_page.dart';


class RoutNav {
  static String home = '/';
  static String login = '/login';
  static String user = '/user';

  static String goToHome() => home;

  static String goToLogin() => login;

  static String getToUserPAge() => user;

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/login', page: () => LoginPage()),
    // GetPage(name: '/user', page: ()=>UserPAge())
  ];
}
