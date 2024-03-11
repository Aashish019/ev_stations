import 'package:ev_stations/controller/auth/authpass.dart';
import 'package:ev_stations/controller/auth/signupcontroller.dart';
import 'package:ev_stations/pages/widgets/my_button.dart';
import 'package:ev_stations/pages/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final void Function()? onTap;
  final signupController = Get.put(SignUpController());
  final authController = Get.put(AuthController());
  SignUpPage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: signupController.signupKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SignUp Page",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Let create an account for you",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  validator: (email) => signupController.validateEmail(email),
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: signupController.emcontroller,
                  obscureText: false,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  validator: (name) => signupController.validateName(name),
                  prefixIcon: const Icon(Icons.person_outlined),
                  controller: signupController.namecontroller,
                  obscureText: false,
                  hintText: "Name",
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => MyTextField(
                      validator: (pwd) =>
                          signupController.validatePassword(pwd),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: () {
                            authController.showpass.value =
                                !authController.showpass.value;
                          },
                          child: Icon(authController.showpass.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      controller: signupController.pwcontroller,
                      obscureText: authController.showpass.value,
                      hintText: "Password",
                    )),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => MyTextField(
                      validator: (pwd) =>
                          signupController.validateConfirmPassword(pwd),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: () {
                            authController.showpass.value =
                                !authController.showpass.value;
                          },
                          child: Icon(authController.showpass.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      controller: signupController.cpwcontroller,
                      obscureText: authController.showpass.value,
                      hintText: "Confirm Password",
                    )),
                const SizedBox(
                  height: 15,
                ),
                MyButton(
                  onTap: () => signupController.onSignup(),
                  text: "SignUp",
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        " Login Now",
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
