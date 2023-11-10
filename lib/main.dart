import 'package:flutter/material.dart';


import 'package:my_1_app/src/core/services/auth/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_1_app/src/core/services/auth_gate.dart';

import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const DemandApp(),
  ));
}

class DemandApp extends StatelessWidget {
  const DemandApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Auth',
        home: AuthGate()
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //    builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        //     if(snapshot.hasData) {
        //       return const DemandAppHome();
        //     } else {
        //       return const LogInPage();
        //     }
        //     },
        // ),
        // initialRoute: '/login',
        // routes: {
        //   '/home': (context) => const DemandAppHome(),
        //   '/login': (context) => const LogInPage(),
        //   "/menu":(context) => const Menu(),
        // },
        );
  }
}
