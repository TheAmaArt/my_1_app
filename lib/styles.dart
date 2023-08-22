import 'package:flutter/material.dart';

class  AppColors {
  final decoration = const BoxDecoration(
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
          );
          
}
