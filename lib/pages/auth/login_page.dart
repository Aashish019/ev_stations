import 'package:ev_stations/controller/auth/authpass.dart';
import 'package:ev_stations/controller/auth/logincontroller.dart';
import 'package:ev_stations/pages/widgets/my_button.dart';
import 'package:ev_stations/pages/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  final loginController = Get.put(LoginController());
  final authController = Get.put(AuthController());
  LoginPage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: loginController.loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login Page",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  validator: (email) => loginController.validateEmail(email),
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: loginController.emcontroller,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => MyTextField(
                      validator: (pwd) => loginController.validatePassword(pwd),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: () {
                            authController.showpass.value =
                                !authController.showpass.value;
                          },
                          child: Icon(authController.showpass.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      controller: loginController.pwcontroller,
                      obscureText: authController.showpass.value,
                      hintText: "Password",
                    )),
                const SizedBox(
                  height: 15,
                ),
                MyButton(
                  onTap: () {
                    loginController.onLogin();
                  },
                  text: "Login",
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        " Register Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
