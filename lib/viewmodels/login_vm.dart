import 'package:flutter/material.dart';

class LoginVm with ChangeNotifier {
  final TextEditingController usernameController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 

  bool rememberMe = false;
  bool hidePassword = true;

  void toggleRememberMe(bool? val) {
    rememberMe = val ?? false;
    notifyListeners();
  }

  void toggleVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void onTapLogIn() {
    
  }

  void onTapForgotPassword() {
    
  }
}
