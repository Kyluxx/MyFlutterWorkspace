import 'dart:convert';

import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/api.dart';
import 'package:http/http.dart' as http;

class AccountService {
  static Future<ResUserModel> createAccount(name, email, password) async {
    print('name: $name, email: $email, password: $password');
    final response = await http.post(
      Uri.parse(Api.registerUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': name,
        'email': email,
        'password': password,
      }),
    );

    print(response.body);
    return ResUserModel.fromJson(jsonDecode(response.body));
  }

  static Future<ResUserModel> login(identifier, password, isEmail) async {
    final response = await http.post(
      Uri.parse(Api.loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'identifier': identifier,
        'password': password,
        'isEmail': isEmail,
      }),
    );
    return ResUserModel.fromJson(jsonDecode(response.body));
  }
}
