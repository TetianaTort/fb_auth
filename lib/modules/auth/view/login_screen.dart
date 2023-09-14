import 'package:flutter/material.dart';

import '../../../global/widgets/app_main_button.dart';
import '../../../global/widgets/app_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              const AppTextField(
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              const AppTextField(
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
              const AppMainButton(
                backgroundColor: Colors.black,
                title: 'Login',
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
                  backgroundColor: Colors.grey[200]!, imagePath: 'lib/global/images/social.png'),
            ],
          ),
        ),
      ),
    );
  }
}
