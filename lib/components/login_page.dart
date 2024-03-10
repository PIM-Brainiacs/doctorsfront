import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
import 'package:login_signup/components/common/page_heading.dart';
import 'package:login_signup/components/common/page_header.dart';
import 'package:login_signup/components/forget_password_page.dart';
import 'package:login_signup/components/signup_page.dart';
import 'package:login_signup/services/userapiservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 243, 245, 245)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const PageHeader(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const PageHeading(
                              title: '\nLog-in',
                            ),
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: _emailController,
                              validator: (textValue) {
                                if (textValue == null || textValue.isEmpty) {
                                  return 'Email is required!';
                                }
                                if (!EmailValidator.validate(textValue)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller: _passwordController,
                              validator: (textValue) {
                                if (textValue == null || textValue.isEmpty) {
                                  return 'Password is required!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPasswordPage()));
                                },
                                child: const Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 119, 115, 115),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFormButton(
                              innerText: 'Login',
                              onPressed: _handleLoginUser,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Or continue as a Guest",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 119, 194, 245),
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account ? ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff939393),
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupPage()));
                                  },
                                  child: const Text(
                                    'Sign-up',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff748288),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleLoginUser() {
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Submitting data..')));
      UserApiService.authenticateUser(
          _emailController.text, _passwordController.text);
    }
  }
}
