import 'package:ev_stations/pages/home/bottambar/bottambarpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();
  @override
  void dispose() {
    emcontroller.dispose();
    pwcontroller.dispose();
    super.dispose();
  }

  final loginKey = GlobalKey<FormState>();
  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return "Email is not valid";
    }
    return null;
  }

  validatePassword(String? pwd) {
    if (!GetUtils.isLengthGreaterOrEqual(pwd, 6)) {
      return "Password is not valid or minimum length is 6";
    }
    return null;
  }

  Future onLogin() async {
    if (loginKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        "Login Successful",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      return Get.to(() => Bottambarpage());
    }
    Get.snackbar(
      'Error',
      "Login validation failed",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
    return;
  }
}
