import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/Pages/login_page.dart';
import 'package:myapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.put(UserController());
  List<dynamic> user =[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title:const Text("Welcome"),
          actions: [IconButton(
      icon: Icon(Icons.logout),
      onPressed:() async{
                    var sharedpref= await SharedPreferences.getInstance();
                    sharedpref.setBool(SplashScreenController.Keylogin, false);
                    Get.offAll(LoginPage());
                    },
        )
      ]
    ),
      body: Obx(
        () {
          if (userController.users.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                final user = userController.users[index];
                final userName = user['name']['first'] + ' ' +
                    user['name']['last'];
                final userEmail = user['email'];

                return ListTile(
                  title: Text(userName),
                  subtitle: Text(userEmail),
                );
              },
            );
          }
        }
      ),
    );
  }

}
class UserController extends GetxController {
  var users = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      users.value = jsonBody['results'];
    } else {
      throw Exception('Failed to load users');
    }
  }
}


