import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'package:myappflutter/pages/home.dart';
import 'package:myappflutter/pages/login.dart';
import 'package:myappflutter/pages/signin.dart';
import 'package:myappflutter/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthService()), // Define el Provider de AuthService
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
        '/signIn': (context) => Signin(),
      },
    );
  }
}
