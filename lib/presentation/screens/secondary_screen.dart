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
          actions: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.exit_to_app,color: themeApp.secondaryHeaderColor)
            )
          ],
          title: Text("USER -  ${user.username}",
          style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: themeApp.secondaryHeaderColor,fontSize: 30),),
          centerTitle: true,
          backgroundColor: themeApp.primaryColor,
          automaticallyImplyLeading: false,          
        ),
        body: Center(
          child: Column(
              children: [
                const SizedBox(height: 60),

                _UserInfoContainer(themeApp: themeApp, user: user),

                const SizedBox(height: 60),

                Text("Bienvenido/a ${user.username}",style: const TextStyle(color: Colors.red,fontSize: 20,decoration: TextDecoration.underline),)
              ],
          ),
        ),
      ),
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    required this.themeApp,
    required this.user,
  });

  final ThemeData themeApp;
  final User user;

  @override
  Widget build(BuildContext context) {
    final sizeOfScreen = MediaQuery.of(context).size;
    return 
          SizedBox(
            width: sizeOfScreen.width*0.9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: themeApp.primaryColor,
              ),
              child: 
              Column(
                children: [
                  Container(
                    width: sizeOfScreen.width*0.9,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      color: Color.fromARGB(255, 7, 176, 255)
                    ),
                    child: Text(user.username,style:  TextStyle(color: themeApp.secondaryHeaderColor,fontSize: 30,),textAlign: TextAlign.center,)
                    ),
                  Text("Password: ${user.password}",style:  TextStyle(color: themeApp.secondaryHeaderColor,fontSize: 20),),
                  Text("User Info: ${user.information}",style:  TextStyle(color: themeApp.secondaryHeaderColor,fontSize: 20),),
                ],
              ),
            ),
          );
  }
}