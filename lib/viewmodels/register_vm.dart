import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/types.dart';
import '../models/user_model.dart';
import '../services/account.dart';

class RegisterVm with ChangeNotifier {
  UserModel? _currentUser;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  bool hidePassword = true;

  UserModel? get currentUser => _currentUser;

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
  }) async {
    try {
      final res = await AccountService.createAccount(
        usernameController.text,
        emailController.text,
        passwordController.text,
      );

      print(res);

      switch (res.messages.status) {
        case "201":
          onSuccess(msg: res.messages.msg);
          break;
        default:
          onFail(msg: res.messages.msg);
          break;
      }
    } catch (e, s) {
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

  void updateCurrentUser(UserModel data) {
    _currentUser = data;
    notifyListeners();
  }
}
