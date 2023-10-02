import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/user_model.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuth(BuildContext context) {
    getUserData().then((value) {
      if (value.token == 'null') {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    });
  }
}
