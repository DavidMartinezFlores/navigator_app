import 'package:flutter/material.dart';
import 'package:navigator_app/config/theme/app_theme.dart';
import 'package:navigator_app/models/user.dart';

class SecondaryScreen extends StatelessWidget {
  final User user;
  const SecondaryScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final themeApp = AppTheme(selectedColor: 1).theme();
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("INFORMACION DE SESION"),
          centerTitle: true,
          backgroundColor: themeApp.secondaryHeaderColor,
        ),
        body: Center(
          child: Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.green),
                    color: themeApp.secondaryHeaderColor
                    ),
                  child: Column(
                    children: [
                      Text(user.username,style: const TextStyle(color: Colors.red,fontSize: 20),),
                      Text(user.password,style: const TextStyle(color: Colors.red,fontSize: 20),),
                      Text(user.information,style: const TextStyle(color: Colors.red,fontSize: 20),),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Text("Bienvenido/a ${user.username}",style: const TextStyle(color: Colors.red,fontSize: 20),)
              ],
          ),
        ),
      ),
    );
  }
}