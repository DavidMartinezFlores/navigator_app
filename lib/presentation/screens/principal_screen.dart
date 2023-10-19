import 'package:flutter/material.dart';
import 'package:navigator_app/config/theme/app_theme.dart';
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

    final themeApp = AppTheme(selectedColor: 1).theme();

    return SafeArea(
      child: Scaffold(

        appBar: (orientation==Orientation.portrait) ? AppBar(
          title: const Text("LOGGIN USUARIOS",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: themeApp.primaryColor,
        ):null,

          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: sizeOfScreen.height*0.1),
            
                  const Text("Nombre Usuario: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: themeApp.secondaryHeaderColor,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))
                        )
                    ),
                    controller: textControllerName,
                    onFieldSubmitted: (value) {

                      logUser(context,usersProvider.userList, textControllerLoggin.value.text, textControllerName.value.text);
                      logginPopUp(context);
                      
                    },
                    ),
            
                  SizedBox(height: sizeOfScreen.height*0.1),
            
                  const Text("Pass de Usuario: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: themeApp.secondaryHeaderColor,
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                      ),
                    controller: textControllerLoggin,
                    onFieldSubmitted: (value) {

                      logUser(context,usersProvider.userList, textControllerLoggin.value.text, textControllerName.value.text);
                      logginPopUp(context);

                    },
                    ),
                    
                    SizedBox(height: sizeOfScreen.height*0.1),

                    FilledButton(onPressed: () {

                      logUser(context,usersProvider.userList, textControllerLoggin.value.text, textControllerName.value.text);
                      logginPopUp(context);

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

  void logginPopUp(BuildContext context){
    if(!logged){
        showDialog(
          barrierDismissible: false,
          context: context, 
          builder: (context) => AlertDialog(
            title: const Text("! CUIDADO !",style: TextStyle(color: Colors.red),),
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
  }
}