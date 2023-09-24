import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/components/round_button.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                  context,
                  emailFocusNode,
                  passwordFocusNode,
                );
              },
              decoration: const InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                prefixIcon: Icon(Icons.alternate_email),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword.value,
                    obscuringCharacter: '*',
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          child: Icon(_obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                        )),
                  );
                }),
            SizedBox(
              height: height * 0.05,
            ),
            RoundButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPressed: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Email is empty', context);
                  return;
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Password is empty', context);
                  return;
                } else {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString(),
                  };
                  authViewModel.login(data, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
