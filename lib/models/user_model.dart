// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:navigator_app/classes/user.dart';
import 'package:navigator_app/config/data/users_list.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final String username;
    final String password;
    final String information;

    UserModel({
        required this.username,
        required this.password,
        required this.information,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        password: json["password"],
        information: json["information"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "information": information,
    };

  static List<User> getUserList()
  {
    List<User> finalUsersList=[];
    for(var list in usersList)
    {
      UserModel actualUser = UserModel.fromJson(list);
      finalUsersList.add(User(username: actualUser.username, password: actualUser.password, information: actualUser.information));
    }
    return finalUsersList;
  }
}
