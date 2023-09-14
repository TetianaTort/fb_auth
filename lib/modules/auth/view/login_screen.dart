import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../global/widgets/app_main_button.dart';
import '../../../global/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void wrongEmailMessage(String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error),
          );
        });
  }

  void wrongPasswordMessage(String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error),
          );
        });
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
                onPressed: () async {
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

                    if (e.code == 'user-not-found') {
                      wrongEmailMessage(e.message.toString());
                    } else if (e.code == 'wrong-password') {
                      // todo not working normaly  Navigator.pop(context);
                      Navigator.pop(context);

                      wrongPasswordMessage(e.message.toString());
                    }
                  }
                },
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
              // AppMainButton(
              //   backgroundColor: Colors.grey[200]!,
              //   imagePath: 'lib/global/images/social.png',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
