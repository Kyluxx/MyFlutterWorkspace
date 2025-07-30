import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors.dart';
import 'package:flutter_application_1/constant/string.dart';
import 'package:flutter_application_1/views/widgets/alertdialog.dart';
import 'package:flutter_application_1/views/widgets/button.dart';
import 'package:flutter_application_1/views/widgets/textfield.dart';
import 'package:provider/provider.dart';
import '../viewmodels/register_vm.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterVm>(
      builder: (context, regvm, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: CColor.bgColor,
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: CColor.primaryColor,
                            fontFamily: 'NicoMoji',
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CTextFField(
                          label: 'Username',
                          controller: regvm.usernameController,
                        ),
                        CTextFField(
                          label: 'Email',
                          controller: regvm.emailController,
                        ),
                        CTextFField(
                          label: 'Password',
                          controller: regvm.passwordController,
                          obscureText: regvm.hidePassword,
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: regvm.toggleVisibility,
                            child: Icon(
                              regvm.hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CTextFField(
                          label: 'Verify Password',
                          controller: regvm.verifyPasswordController,
                          obscureText: regvm.hidePassword,
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: regvm.toggleVisibility,
                            child: Icon(
                              regvm.hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CButton(
                          label: 'SIGN UP',
                          onTap: () => regvm.onTapSignUp(
                            ctx: context,
                            onSuccess: ({required String msg}) {
                              CAlert(
                                title: CString.success,
                                message: msg,
                                showCancel: true,
                                onConfirm: () =>
                                    Navigator.pushNamed(context, '/login'),
                              ).show(context);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () => regvm.onTapLoginHere(context),
                              child: const Text(
                                'Login here',
                                style: TextStyle(
                                  color: CColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
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
