import 'package:flutter/material.dart';
import 'package:login_signup/services/auth/login_or_register.dart';
import 'package:login_signup/components/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
