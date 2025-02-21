import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: Color(0xFF2E5E66),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre Completo"),
            TextField(
              decoration: InputDecoration(
                hintText: "Nombre (s)",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Apellidos"),
            TextField(
              decoration: InputDecoration(
                hintText: "Apellidos",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Fecha de Nacimiento"),
            TextField(
              decoration: InputDecoration(
                hintText: "Fecha de nacimiento",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Correo Electrónico"),
            TextField(
              decoration: InputDecoration(
                hintText: "Correo electrónico",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Contraseña"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Contraseña",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFF2E5E66)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Aceptar y continuar",
                  style: TextStyle(color: Color(0xFF2E5E66)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
