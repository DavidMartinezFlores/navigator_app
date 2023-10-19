import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';
import 'package:navigator_app/config/providers/users_provider.dart';
import 'package:navigator_app/presentation/screens/secondary_screen.dart';
import 'package:provider/provider.dart';

bool logged = false;

class PrincipalScreen extends StatelessWidget {
  
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = context.watch<UsersProvider>();
    final sizeOfScreen = MediaQuery.of(context).size;

    final TextEditingController textControllerName = TextEditingController();
    final TextEditingController textControllerLoggin = TextEditingController();
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        appBar: (orientation==Orientation.portrait) ? AppBar(
          title: const Text("LOGGIN USUARIOS"),
          centerTitle: true,
        ):null,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: sizeOfScreen.height*0.1),
            
                  const Text("Nombre Usuario: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                    controller: textControllerName,
                    onFieldSubmitted: (value) {
                      usersProvider.addUserName(value.toString().trim());
                    },
                    ),
            
                  SizedBox(height: sizeOfScreen.height*0.1),
            
                  const Text("Pass de Usuario: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: const InputDecoration(fillColor: Colors.blue,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                    controller: textControllerLoggin,
                    onFieldSubmitted: (value) {
                      usersProvider.addLoggin(value.toString().trim());
             
                      for(User user in usersProvider.userList){
                        if(user.password==usersProvider.loggin && user.username==usersProvider.userName)
                        {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => SecondaryScreen(user: user,))
                          );
                        }
                      }
                    },
                    ),
                    
                    SizedBox(height: sizeOfScreen.height*0.1),

                    FilledButton(onPressed: () {
                      print(orientation);
                      logUser(context,usersProvider.userList, textControllerLoggin.value.text, textControllerName.value.text);
                      if(!logged)
                      {
                          showDialog(
                            barrierDismissible: false,
                            context: context, 
                            builder: (context) => AlertDialog(
                              title: const Text("! CUIDADO !"),
                              content: const Text("Usuario o contraseña incorrectos",style: TextStyle(color: Colors.red),),
                              actions: [
                                TextButton(onPressed: 
                                () {
                                  Navigator.pop(context);
                                }, child: const Text("Reintentar"))
                              ],
                          )
                        );
                      }
                      logged=false;
                      
                      
                    }, child: const Text("Iniciar Sesion")
                    ),
                    
            
                ],
              ),
            ),
          ),
        ),
    );
  }

  void logUser(BuildContext context,List<User>lista,String pass , String userName)
  {
    for(User user in lista){
      if(user.password==pass && user.username==userName)
      {
        logged=true;
        Navigator.push(context,MaterialPageRoute(builder: (context) => SecondaryScreen(user: user,)) );
      }
    }
  }
}