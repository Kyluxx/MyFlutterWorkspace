import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors.dart';
import 'package:flutter_application_1/viewmodels/login_vm.dart';
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
          body: SafeArea(
            child: Padding(
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
                  CTextFField(label: 'Username', controller: logvm.usernameController),
                  CTextFField(
                    label: 'Password',
                    controller: logvm.passwordController,
                    obscureText: true,
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
                    onTap: logvm.onTapLogIn,
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
        );
      },
    );
  }
}
