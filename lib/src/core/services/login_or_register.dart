import 'package:flutter/material.dart';
import 'package:my_1_app/src/features/log_in_page/presentation/log_in_screen.dart';
import 'package:my_1_app/src/features/log_in_page/presentation/register_page.dart';

class LogInOrRegister extends StatefulWidget {
  const LogInOrRegister({super.key});

  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {
  //initialli show the log in Screen
  bool showLogInPage = true;

  //toggle between Login and register Page
  void togglePages() {
    setState(
      () {
        showLogInPage = !showLogInPage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return LogInPage(onTap: togglePages);
    }else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
