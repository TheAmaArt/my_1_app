import "package:flutter/material.dart";
import "package:my_1_app/src/core/presentation/styles/color_styles.dart";
import "package:my_1_app/src/core/presentation/widgets/componends/my_button.dart";
import "package:my_1_app/src/core/presentation/widgets/componends/my_text_field.dart";
import "package:my_1_app/src/core/services/auth/auth_service.dart";
import "package:provider/provider.dart";

class LogInPage extends StatefulWidget {
  final void Function()? onTap;
  const LogInPage({super.key, this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //Text controlling
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signIn() async {
    //get the Auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  // Angi war da :3
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kPrimaryAppBarColor),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Logo
                  Icon(
                    Icons.message,
                    size: 100,
                    color: Colors.grey[800],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  // Welcome back message!
                  const Text(
                    "Welcome back you've been missed",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Email Textfield
                  MyTextfield(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),
                  // Password Textfield
                  MyTextfield(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true),

                  const SizedBox(
                    height: 25,
                  ),

                  // Sign in Button
                  MyButton(onTap: signIn, text: "Sign In"),

                  const SizedBox(height: 50),

                  // not a member now ? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text("not a Member ?  Register Now")),
                      const SizedBox(height: 4),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
