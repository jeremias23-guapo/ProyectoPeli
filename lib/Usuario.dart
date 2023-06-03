import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
class RegistroUsuarioScreen extends StatefulWidget {
  @override
  _RegistroUsuarioScreenState createState() => _RegistroUsuarioScreenState();
}

class _RegistroUsuarioScreenState extends State<RegistroUsuarioScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _registrarUsuario() async {
    try {
      String email = _emailController.text;
      String password = _passwordController.text;
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Usuario registrado correctamente');
      // Realiza acciones adicionales después de registrar al usuario, si es necesario.
    } catch (e) {
      print('Error al registrar usuario: $e');
      // Maneja el error de registro de usuario aquí.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              height: 100.0,
              child: Image.asset(
                'assets/dot.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              children: [
                 TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white), // Color del texto
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white), // Color del texto
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _registrarUsuario();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Registrarse'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Personaliza el color de fondo del botón
                    onPrimary: Colors.white, // Personaliza el color del texto del botón
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0), // Ajusta el espaciado interno del botón
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}