

import 'package:flutter/material.dart';
import 'package:my_1_app/demand_app_home.dart';

import 'package:my_1_app/log_in_screen.dart';
import 'package:my_1_app/menu.dart';

void main() {
  runApp(const DemandApp());
}
class DemandApp extends StatelessWidget {
  const DemandApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demand_App',
      initialRoute: '/login',
      routes: {
        '/home': (context) => const DemandAppHome(),
        '/login': (context) => const LogInPage(),
        "/menu":(context) => const Menu(),
      },
    );
  }
}