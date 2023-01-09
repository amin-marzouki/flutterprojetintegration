import 'package:flutter/material.dart';
import 'package:projetIntegration/models/user_model.dart';
import 'package:projetIntegration/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {String name,
      String email,
      String password,
      String adress,
      int mobile,
      int age}) async {
    try {
      UserModel user = await AuthService().register(
          name: name,
          adress: adress,
          email: email,
          password: password,
          mobile: mobile,
          age: age);

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
