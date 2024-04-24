import 'package:flutter/material.dart';
import 'package:login_signup/services/auth/auth_service.dart';
import 'package:login_signup/components/my_button.dart';
import 'package:login_signup/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  // Final TextEditingControllers for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Optional onTap function for registration (can be null)
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(emailController.text , passwordController.text,);
    }
    // ereur
    catch (e) {
      showDialog(
        context: context, 
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Icon(Icons.message, size: 80),
              const Text("Welcome back !"),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () =>  login(context), // Call the login function
                
                text: "Login"
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap, // Call the provided onTap function for registration
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
