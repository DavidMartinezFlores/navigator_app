import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';
import 'package:navigator_app/models/user_model.dart';

class UsersProvider extends ChangeNotifier{
  final List<User> userList=[];

  String userName="---NINGUNO---";
  String loggin="";

  void fillUserList(){
    userList.addAll(UserModel.getUserList());
    notifyListeners();
  }

  void addUserName(String userName){
    this.userName=userName;
    notifyListeners();
  }

    void addLoggin(String loggin){
    this.loggin=loggin;
    notifyListeners();
  }
}
