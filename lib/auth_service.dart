import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Usuario.dart';
import 'HomeScreen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> signInWithEmailPassword(
      BuildContext context, String email, String password) async {
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print('Error durante el inicio de sesión: $e');
      _showErrorDialog(context,
          'Error durante el inicio de sesión. Por favor, verifica tus datos e intenta nuevamente.');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('Sesión cerrada correctamente');
      // Realiza acciones adicionales después de cerrar sesión, si es necesario.
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
  }
}
