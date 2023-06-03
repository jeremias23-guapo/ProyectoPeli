import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pelifire/HomeScreen.dart';
import 'firebase_options.dart';
import 'login_screen.dart';
import 'auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Pantalla de inicio de sesión
    );
  }
}
