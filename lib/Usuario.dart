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
  bool _isPasswordVisible = false;
  void _registrarUsuario() async {
    try {
      String email = _emailController.text;
      String password = _passwordController.text;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Usuario registrado correctamente');
      _mostrarAlertaUsuarioCreado(); // Muestra la alerta de usuario creado
      // Realiza acciones adicionales después de registrar al usuario, si es necesario.
    } catch (e) {
      print('Error al registrar usuario: $e');
      _mostrarAlertaErrorRegistro(); // Muestra la alerta de error de registro
    }
  }

  void _mostrarAlertaUsuarioCreado() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Impide que el cuadro de diálogo se cierre al tocar fuera de él
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
        return AlertDialog(
          title: Text('Usuario creado'),
          content: Text('Usuario creado correctamente.'),
        );
      },
    );
  }

  void _mostrarAlertaErrorRegistro() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error de registro'),
          content: Text('No se pudo registrar al usuario.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
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
            child: Card(
              elevation: 4.0,
              color: const Color.fromARGB(
                  139, 158, 158, 158), // Color de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20.0), // Ajusta el radio de borde de la tarjeta
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 46.0),
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
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                    ),
                    SizedBox(height: 46.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _registrarUsuario();
                          },
                          child: Text('Registrarse'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .blue, // Personaliza el color de fondo del botón
                            onPrimary: Colors
                                .white, // Personaliza el color del texto del botón
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
