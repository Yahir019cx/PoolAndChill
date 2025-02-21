import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenedor blanco de fondo
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),

          // Contenedor azul con bordes redondeados abajo
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45, // 40% de la pantalla
            decoration: BoxDecoration(
              color: Color(0xFF2E5E66),
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen del logo con movimiento libre
                Transform.translate(
                  offset: Offset(0, -55), // Mueve la imagen hacia arriba
                  child: Image.asset(
                    'assets/images/logoLT.png',
                    width: 280,
                    height: 280,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),

                // Eslogan con movimiento libre
                Transform.translate(
                  offset: Offset(0, -165), // Mueve el eslogan hacia arriba
                  child: Text(
                    "Relájate, disfruta, reserva.",
                    style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenedor blanco con redondeo superior
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27, // Empieza desde el 40% de la pantalla
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6, // Cubre el resto de la pantalla
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70), // Redondeo en la parte superior izquierda
                  topRight: Radius.circular(70), 
                ),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
