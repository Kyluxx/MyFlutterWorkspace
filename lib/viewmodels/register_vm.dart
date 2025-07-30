import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/navigator.dart';
import 'package:flutter_application_1/global/regex.dart';
import 'package:flutter_application_1/global/response.dart';
import 'package:flutter_application_1/global/types.dart';
import 'package:flutter_application_1/views/widgets/loadingoverlay.dart';
import '../services/account.dart';

class RegisterVm with ChangeNotifier {

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  bool hidePassword = true;

  void toggleVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void onTapLoginHere(ctx) {
    Navigator.pushNamed(ctx, '/login');
  }

  Future<void> onTapSignUp({
    required ResCallback onSuccess,
    required ResCallback onFail,
    required BuildContext ctx,
  }) async {
    final username = usernameController.text;
    final email = emailController.text.trim();
    final password = passwordController.text;
    final verifyPassword = verifyPasswordController.text;


    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        verifyPassword.isEmpty) {
      onFail(msg: 'All fields are required');
      return;
    }

    if (Regex.email.hasMatch(email) == false) {
      onFail(msg: 'Email is not valid');
      return;
    }

    if (password != verifyPassword) {
      onFail(msg: 'Password does not match');
      return;
    }

    if(Regex.passwordStrength.hasMatch(password) == false) {
      onFail(msg: 'Password is not strong enough');
      return;
    }

    try {
      LoadingOverlay().show(ctx);
      final res = await AccountService.createAccount(username, email, password);
      ctxPop(ctx);
      print(res);
      resCodeCallback(res.messages, onSuccess: onSuccess, onFail: onFail);
    } catch (e, s) {
      ctxPop(ctx);
      print('ERROR IN SIGNUP: $e');
      print('STACK: $s');
    }
  }

  @override

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
