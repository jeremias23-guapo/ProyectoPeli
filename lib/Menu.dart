import 'package:flutter/material.dart';
import 'login_screen.dart';

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 151, 149, 149),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: ListView(
        children: [
          ListTile(
            title: Row(
              children: [
                Icon(Icons.download, size: 23),
                SizedBox(
                    width: 3), // Ajusta el espacio entre el icono y el texto
                Text(
                  'Descargas',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.favorite, size: 23),
                SizedBox(width: 3),
                Text('Mis favoritos', style: TextStyle(fontSize: 18)),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.category, size: 23),
                SizedBox(width: 3),
                Text('Categogias', style: TextStyle(fontSize: 18)),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.settings, size: 23),
                SizedBox(width: 3),
                Text('Configuración', style: TextStyle(fontSize: 18)),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.exit_to_app, size: 23),
                SizedBox(width: 3),
                Text('Cerrar sesión', style: TextStyle(fontSize: 18)),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmación'),
                    content: Text('¿Estás seguro de que deseas cerrar sesión?'),
                    actions: [
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Aceptar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
