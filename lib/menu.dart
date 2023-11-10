import 'package:flutter/material.dart';
import 'package:my_1_app/src/core/presentation/styles/color_styles.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: kPrimaryBackGroundColor   
          ),
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: kPrimaryAppBarColor
          ),
        ),
        title: const Text("Einstellungen"),
      ),
    );
  }
}
