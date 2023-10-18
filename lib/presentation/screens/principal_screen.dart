import 'package:flutter/material.dart';
import 'package:navigator_app/classes/user.dart';
import 'package:navigator_app/config/providers/users_provider.dart';
import 'package:navigator_app/presentation/screens/secondary_screen.dart';
import 'package:provider/provider.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = context.watch<UsersProvider>();

    final TextEditingController textControllerName = TextEditingController();
    final TextEditingController textControllerLoggin = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("LOGGIN USUARIOS"),
          centerTitle: true,
        ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text("Nombre Usuario: "),
                TextFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                  controller: textControllerName,
                  onFieldSubmitted: (value) {
                    usersProvider.addUserName(value.toString().trim());
                  },
                  ),

                const SizedBox(height: 20),

                const Text("Pass de Usuario: "),
                TextFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
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

                  const SizedBox(height: 20),
                  Text("Selected USERNAME: ${usersProvider.userName}",
                  style: const TextStyle(
                    fontWeight:FontWeight.bold,color: Colors.red),
                  )
              ],
            ),
          ),
        ),
    );
  }
}