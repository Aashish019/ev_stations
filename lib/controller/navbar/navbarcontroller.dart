import 'package:ev_stations/pages/home/bookingpage.dart';
import 'package:ev_stations/pages/home/homepage.dart';
import 'package:ev_stations/pages/home/profilepage.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  final List pages = [
    const HomePage(),
    const BookingPage(),
    const ProfilePage()
  ];
}
