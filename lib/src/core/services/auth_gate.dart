import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1_app/demand_app_home.dart';
import 'package:my_1_app/src/core/services/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //is user logged in
            if (snapshot.hasData) {
              return const DemandAppHome();
            }

            //is user not logged in
            else {
              return const LogInOrRegister();
            }
          },),
    );
  }
}
