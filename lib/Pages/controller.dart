import 'package:get/get.dart';
import 'package:myapp/Pages/home_page.dart';


class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;

  final emailError = RxString('');
  final passwordError = RxString('');

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  bool get isEmailValid => emailError.value.isEmpty;

  bool get isPasswordValid => passwordError.value.isEmpty;

  static bool keyOne = false;
  static bool keyTwo = false;


  void validateEmail(String value) {
    email.value = value;
    if (value.isEmpty) {
      emailError.value = 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      emailError.value = 'Invalid email format';
    } else {
      emailError.value = '';
      keyOne = true;
    }
  }

  void validatePassword(String value) {
    password.value = value;
    if (value.isEmpty) {
      passwordError.value = 'Password is required';
    } else if (value.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      passwordError.value =
      'Password must contain at least one uppercase letter';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      passwordError.value =
      'Password must contain at least one lowercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      passwordError.value = 'Password must contain at least one digit';
    } else {
      passwordError.value = '';
      keyTwo = true;
    }
  }

  void login() {
    if (isEmailValid && isPasswordValid) {
      if (keyOne && keyTwo) {
        Get.offAll(HomePage());
        Get.snackbar("Success", "successful");
      } else {
        Get.snackbar("Invalid", "Requires Valid User Credential");
      }
    }
  }
}//
