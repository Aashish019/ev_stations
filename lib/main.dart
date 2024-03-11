import 'package:ev_stations/controller/auth/loginorsignup.dart';
import 'package:ev_stations/theme/light_mod.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'EV Stations',
      theme: lightMode,
      home: const LoginOrSignUp(),
    );
  }
}
