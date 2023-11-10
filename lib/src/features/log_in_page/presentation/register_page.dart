import 'package:flutter/material.dart';
import 'package:my_1_app/src/core/presentation/styles/color_styles.dart';
import 'package:my_1_app/src/core/presentation/widgets/componends/my_button.dart';
import 'package:my_1_app/src/core/presentation/widgets/componends/my_text_field.dart';
import 'package:my_1_app/src/core/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text Controlers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign up User
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match !"),
        ),
      );
      return;
    }

    //get Auth Services
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: kPrimaryBackGroundColor),
      child: Scaffold(
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

                    // Create a account message!
                    const Text(
                      "Lets create a Account for you",
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
                      height: 10,
                    ),
                    // Confirm Password
                    MyTextfield(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: true),

                    const SizedBox(
                      height: 25,
                    ),

                    // Sign up Button
                    MyButton(onTap: signUp, text: "Sign Up"),

                    const SizedBox(height: 50),

                    // not a member now ? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Already a Member ? Login Now",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
