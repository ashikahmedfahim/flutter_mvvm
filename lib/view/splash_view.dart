import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_model/services/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
