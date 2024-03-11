import 'package:ev_stations/controller/navbar/navbarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottambarpage extends StatelessWidget {
  final controller = Get.put(NavigationController());
  Bottambarpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (int index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book),
              label: 'Booking',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
    );
  }
}
