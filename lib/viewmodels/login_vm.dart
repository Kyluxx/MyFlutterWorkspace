import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/regex.dart';
import 'package:flutter_application_1/global/response.dart';
import 'package:flutter_application_1/global/types.dart';
import 'package:flutter_application_1/services/account.dart';

class LoginVm with ChangeNotifier {
  final TextEditingController identifierController = TextEditingController();
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

  Future<void> onTapLogIn({
    required ResCallback onSuccess,
    required ResCallback onFail,
  }) async {
    final identifier = identifierController.text;
    final password = passwordController.text;
    final isEmail = Regex.isEmail(identifier);

    if (identifier.isEmpty || password.isEmpty) {
      onFail(msg: 'All fields are required');
      return;
    }

    if (Regex.email.hasMatch(identifier) == false && isEmail == false) {
      onFail(msg: 'Email is not valid');
      return;
    }
    
    
    final res = await AccountService.login(identifier, password, isEmail);
    print(res);
    
    resCodeCallback(res.messages, onSuccess: onSuccess, onFail: onFail);
  }

  void onTapForgotPassword() {}
}
