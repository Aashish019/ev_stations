import 'package:ev_stations/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();
  final TextEditingController cpwcontroller = TextEditingController();
  @override
  void dispose() {
    namecontroller.dispose();
    emcontroller.dispose();
    pwcontroller.dispose();
    cpwcontroller.dispose();
    super.dispose();
  }

  final signupKey = GlobalKey<FormState>();
  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return "Email is not valid";
    }
    return null;
  }

  validateName(String? name) {
    if (!GetUtils.isUsername(name ?? '')) {
      return "Name is not valid";
    }
    return null;
  }

  validatePassword(String? pwd) {
    if (!GetUtils.isLengthGreaterOrEqual(pwd, 6)) {
      return "Password is not valid";
    }
    return null;
  }

  validateConfirmPassword(String? pwd) {
    if (!GetUtils.isLengthGreaterOrEqual(pwd, 6)) {
      return "Password is not valid";
    }
    return null;
  }

  Future onSignup() async {
    if (signupKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        "SignUp Successful please login",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      return Get.to(() => LoginPage());
    }
    Get.snackbar(
      'Error',
      "SignUp validation failed",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
    return;
  }
}
