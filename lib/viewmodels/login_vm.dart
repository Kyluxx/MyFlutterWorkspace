import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/string.dart';
import 'package:flutter_application_1/global/navigator.dart';
import 'package:flutter_application_1/global/regex.dart';
import 'package:flutter_application_1/global/response.dart';
import 'package:flutter_application_1/global/types.dart';
import 'package:flutter_application_1/services/account.dart';
import 'package:flutter_application_1/views/widgets/loadingoverlay.dart';

class LoginVm with ChangeNotifier {
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool hidePassword = true;

  void toggleRememberMe(bool? val) {
    rememberMe = val ?? false;
    notifyListeners();
  }

  void onTapForgotPassword() {}

  void toggleVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  Future<void> onTapLogIn({
    required ResCallback onSuccess,
    required ResCallback onFail,
    required BuildContext ctx,
  }) async {
    try {
      final identifier = identifierController.text;
      final password = passwordController.text;
      final isEmail = Regex.isEmail(identifier);

      if (identifier.isEmpty || password.isEmpty) {
        onFail(msg: 'All fields are required');
        return;
      }

      LoadingOverlay().show(ctx);
      final res = await AccountService.login(identifier, password, isEmail);
      print(res);
      ctxPop(ctx);

      resCodeCallback(res.messages, onSuccess: onSuccess, onFail: onFail);
    } on Exception catch (e) {
      print(e);
      ctxPop(ctx);
      onFail(msg: CString.error);
    }
  }

  @override
  void dispose() {
    identifierController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
