import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors.dart';
import 'package:flutter_application_1/constant/string.dart';
import 'package:flutter_application_1/viewmodels/login_vm.dart';
import 'package:flutter_application_1/views/widgets/alertdialog.dart';
import 'package:flutter_application_1/views/widgets/button.dart';
import 'package:flutter_application_1/views/widgets/textfield.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVm>(
      builder: (context, logvm, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: CColor.bgColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'LOG IN',
                        style: TextStyle(
                          color: CColor.primaryColor,
                          fontFamily: 'NicoMoji',
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(height: 20),
                      CTextFField(
                        label: 'Username or Email',
                        controller: logvm.identifierController,
                      ),
                      CTextFField(
                        label: 'Password',
                        controller: logvm.passwordController,
                        obscureText: logvm.hidePassword,
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: logvm.toggleVisibility,
                          child: Icon(
                            logvm.hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Remember Me',
                          style: TextStyle(color: Colors.white),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: logvm.rememberMe,
                        checkColor: Colors.white,
                        activeColor: CColor.primaryColor,
                        onChanged: (bool? val) => logvm.toggleRememberMe(val),
                      ),
                      SizedBox(height: 20),
                      CButton(
                        label: 'LOG IN',
                        onTap: () => logvm.onTapLogIn(
                          ctx: context,
                          onSuccess: ({required String msg}) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (route) => false,
                            );
                          },
                          onFail: ({required String msg}) {
                            CAlert(
                              title: CString.fail,
                              message: msg,
                            ).show(context);
                          },
                        ),
                        useNicoMoji: true,
                        fontSize: 24,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => logvm.onTapForgotPassword(),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: CColor.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: const Text(
                      'smart with cleverse',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
