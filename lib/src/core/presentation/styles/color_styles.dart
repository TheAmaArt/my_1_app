import 'package:flutter/material.dart';

const LinearGradient kPrimaryBackGroundColor = LinearGradient(
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
            );

const LinearGradient kPrimaryAppBarColor = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.pinkAccent, Colors.yellow],
            );


const LinearGradient kPrimaryButtonColor = LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.pinkAccent,
                            Colors.deepPurpleAccent,
                          ],
                        );

