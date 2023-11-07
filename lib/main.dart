import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'package:myappflutter/pages/home.dart';
import 'package:myappflutter/pages/login.dart';
import 'package:myappflutter/pages/signin.dart';
import 'package:myappflutter/pages/predict.dart';
import 'package:myappflutter/services/auth_service.dart';
import 'package:myappflutter/services/apiservice.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ApiService()),
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
        '/home': (context) => Predict(),
        '/signIn': (context) => Signin(),
      },
    );
  }
}
