import 'package:flutter/material.dart';
import 'package:login_plantlink/Scroll/plantlink_page.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../navigation/itemspaa.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controler = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScren(){
    return [
      const PlantLinkPage(),
      //SensorsPage(),
      //ESP8266Page(),
      const ItemsPa(),
      //const PantallaDatos(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem(){
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, color: Colors.white,),
        activeColorPrimary: const Color.fromARGB(255, 240, 0, 0),
        inactiveIcon: const Icon(Icons.home, color: Color.fromARGB(255, 3, 48, 15),)
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.sensors_rounded, color: Colors.white,),
        activeColorPrimary: const Color.fromARGB(255, 240, 0, 0),
        inactiveIcon: const Icon(Icons.sensors_rounded, color: Color.fromARGB(255, 3, 48, 15),)
      ),
      /*PersistentBottomNavBarItem(
        icon: Icon(Icons.person, color: Colors.white,),
        activeColorPrimary: Color.fromARGB(255, 240, 0, 0),
        inactiveIcon: Icon(Icons.person, color: Color.fromARGB(255, 3, 48, 15),)
      ),*/
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScren(),
      items: _navBarItem(),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      decoration: NavBarDecoration(
        colorBehindNavBar: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}