import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/home_screen.dart';
import 'package:flutter_mvvm/view/login_screen.dart';
import 'package:flutter_mvvm/view/register_screen.dart';
import 'package:flutter_mvvm/view/splash_view.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Scaffold(
              body: Center(
                child: Text('Page not found'),
              ),
            );
          },
        );
    }
  }
}
