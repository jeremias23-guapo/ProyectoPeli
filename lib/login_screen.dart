import 'package:flutter/material.dart';
import 'auth_service.dart'; // Importa el archivo de servicios de autenticación
import 'Usuario.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService(); // Instancia de AuthService

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    _authService.signInWithEmailPassword(context, email, password);
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
                    _login(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Iniciar Sesión'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistroUsuarioScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
