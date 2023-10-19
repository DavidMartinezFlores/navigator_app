import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';

class SecondaryScreen extends StatelessWidget {
  final User user;
  const SecondaryScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("INFORMACION DE SESION"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.green),color: const Color.fromARGB(255, 75, 132, 178)),
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