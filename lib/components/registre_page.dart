import 'package:flutter/material.dart';
import 'package:login_signup/services/auth/auth_service.dart';
import 'package:login_signup/components/my_button.dart';
import 'package:login_signup/components/my_text_field.dart';

class RegistrePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmerpasswordController = TextEditingController();
  final void Function()? onTap;

  RegistrePage({Key? key, required this.onTap}) : super(key: key);

  // Méthode pour s'inscrire
  void registre(BuildContext context) {
    // Service d'authentification
    final _auth = AuthService();

    // Vérifier si les mots de passe correspondent lors de la création de l'utilisateur
    if (passwordController.text == confirmerpasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // Les mots de passe ne correspondent pas
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Les mots de passe ne correspondent pas !"),
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
              const Text("Créons un compte !"),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Mot de passe',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: confirmerpasswordController,
                hintText: 'Confirmer le mot de passe',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () => registre(context),
                text: "S'inscrire",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vous avez déjà un compte ? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Connectez-vous",
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
