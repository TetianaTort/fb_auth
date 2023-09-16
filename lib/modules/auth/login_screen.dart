import 'package:fb_auth/global/services/auth_sevice.dart';
import 'package:fb_auth/modules/auth/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../global/widgets/app_main_button.dart';
import '../../global/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void wrongLoginMessage(String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error),
          );
        });
  }

  void loginUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongLoginMessage(e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: const Text('login'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.person, size: 135),
                AppTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                              color: Colors.grey[600],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey[600]),
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                AppMainButton(
                  backgroundColor: Colors.black,
                  title: 'Login',
                  onPressed: loginUser,
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Text('Or continue with'),
                    Expanded(child: Divider())
                  ],
                ),
                const SizedBox(height: 20),
                AppMainButton(
                  backgroundColor: Colors.grey[200]!,
                  imagePath: 'lib/global/images/social.png',
                  onPressed: () => AuthService().signInWithGoogle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text('Register now'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
