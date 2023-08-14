import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.7,
                0.9,
              ],
              colors: [
                Colors.yellowAccent,
                Colors.red,
                Colors.indigo,
                Colors.teal,
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.pinkAccent, Colors.yellow],
            ),
          ),
        ),
        title: const Text("Einstellungen"),
      ),
    );
  }
}
