import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Usuario.dart';
import 'HomeScreen.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Sesión iniciada correctamente');
      // El inicio de sesión fue exitoso, y puedes acceder al usuario autenticado:
      User? user = userCredential.user;
      // Realiza acciones adicionales según tus necesidades, como navegar a otra pantalla, etc.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
    } catch (e) {
      // Maneja los errores de inicio de sesión aquí.
      print('Error durante el inicio de sesión: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    // Realiza acciones adicionales después de cerrar sesión, si es necesario.
  }
}
