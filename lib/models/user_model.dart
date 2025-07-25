// model Users {
//   id    Int    @id @default(autoincrement())
//   name  String
//   email String @unique
//   todo Todo[]
// }

import 'package:flutter_application_1/models/res_messages_model.dart';

class ResUserModel {
  final UserModel data;
  final ResMessagesModel messages;

  ResUserModel({required this.data, required this.messages});

  factory ResUserModel.fromJson(Map<String, dynamic> json) {
    return ResUserModel(
      data: UserModel.fromJson(json['data']),
      messages: ResMessagesModel.fromJson(json['messages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'messages': messages.toJson(),
    };
  }
}

class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}