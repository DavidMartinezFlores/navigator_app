import 'package:flutter/material.dart';
import 'package:navigator_app/config/providers/users_provider.dart';
import 'package:navigator_app/config/theme/app_theme.dart';
import 'package:navigator_app/presentation/screens/principal_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeApp = AppTheme(selectedColor: 1).theme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersProvider()..fillUserList(),)
      ],
      child: MaterialApp(
        theme: themeApp,
        home: const PrincipalScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
