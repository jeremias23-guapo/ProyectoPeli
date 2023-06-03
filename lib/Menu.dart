import 'package:flutter/material.dart';
import 'login_screen.dart';
class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.symmetric(horizontal: 20),
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
            title: Text('Descargas'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Mis favoritos'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Categorías'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Configuración'),
            onTap: () {},
          ),
         ListTile(
  title: Text('Cerrar sesión'),
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
