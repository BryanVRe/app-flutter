import 'package:flutter/material.dart';
import 'package:myappflutter/pages/home.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'package:myappflutter/pages/fit.dart';
import 'package:myappflutter/pages/login.dart';
import 'package:myappflutter/pages/signin.dart';
import 'package:myappflutter/pages/page.dart';
import 'package:myappflutter/services/auth_service.dart';
import 'package:myappflutter/services/apiservice.dart';
import 'package:myappflutter/services/fitservice.dart';
import 'package:myappflutter/services/ubications_service.dart';
import 'package:myappflutter/pages/predict_ubi.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ApiService()),
        ChangeNotifierProvider(create: (_) => FitService()),
        ChangeNotifierProvider(create: (_) => MapService())

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
        '/': (context) => Home(),
        '/home': (context) => NavbarPage(),
        '/signin': (context) => Signin(),
      },
    );
  }
}
