import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          // Utils.toastMessage('Hello World');
          // Utils.flushBarErrorMessage("Click me", context);
          Utils.snackBar("Click me", context);
        },
        child: const Center(
          child: Text('Login Screen'),
        ),
      ),
    );
  }
}
