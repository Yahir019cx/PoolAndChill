import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart'; // Importamos la pantalla de login

class WelcomeScreen extends StatelessWidget {
  final String userName;

  WelcomeScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 131, 143),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡Bienvenido, $userName! 🎉",
              style: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove("token");
                await prefs.remove("userName");

                // 🔹 Corrección: Usar `MaterialPageRoute` en lugar de `pushReplacementNamed`
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text("Cerrar sesión", style: GoogleFonts.openSans(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
