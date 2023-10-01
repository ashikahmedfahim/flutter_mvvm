import 'package:flutter/material.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _registerLoading = false;
  bool get registerLoading => _registerLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setRegisterLoading(bool value) {
    _registerLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext buildContext) async {
    setLoading(true);
    _authRepository
        .login(data)
        .then((value) => Navigator.pushNamed(buildContext, RoutesName.home))
        .catchError(
            (e) => {Utils.flushBarErrorMessage(e.toString(), buildContext)})
        .then((value) => setLoading(false));
  }

  Future<void> register(dynamic data, BuildContext buildContext) async {
    setRegisterLoading(true);
    _authRepository
        .register(data)
        .then((value) => Navigator.pushNamed(buildContext, RoutesName.home))
        .catchError(
            (e) => {Utils.flushBarErrorMessage(e.toString(), buildContext)})
        .then((value) => setRegisterLoading(false));
  }
}
