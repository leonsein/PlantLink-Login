import 'package:flutter/material.dart';
import 'package:login_plantlink/views/bar_navigation/bar_navigation.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
      
    );
  }
}
