import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'register_screen.dart'; // Importa la pantalla de registro

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _selectedIndex = 0; // 0 para Login, 1 para Sign In

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
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 65, 131, 143),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen del logo con movimiento libre
                Transform.translate(
                  offset: Offset(0, -55),
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
                  offset: Offset(0, -160),
                  child: Text(
                    "Relájate, disfruta, reserva.",
                    style: GoogleFonts.oleoScript(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenedor blanco con redondeo superior y elementos agregados
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 70), // Espacio superior

                  // Botón de alternancia (Log In / Sign In)
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height * 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        borderColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        fillColor: Color.fromARGB(255, 65, 131, 143),
                        color: Colors.black,
                        selectedColor: Colors.white,
                        constraints: BoxConstraints(minHeight: 50, minWidth: 120),
                        isSelected: [_selectedIndex == 0, _selectedIndex == 1],
                        onPressed: (index) {
                          setState(() {
                            _selectedIndex = index;
                            if (_selectedIndex == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            }
                          });
                        },
                        children: [
                          Text('Log In',
                              style: GoogleFonts.lilitaOne(fontSize: 16)),
                          Text('Sign In',
                              style: GoogleFonts.lilitaOne(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                  // Campo de Correo Electrónico
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height * 0.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        style: GoogleFonts.openSans(fontSize: 16, color: Colors.black87),
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          labelStyle: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 65, 131, 143),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 65, 131, 143),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Campo de Contraseña
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height * 0.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        obscureText: true,
                        style: GoogleFonts.openSans(fontSize: 16, color: Colors.black87),
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 65, 131, 143),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 65, 131, 143),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Botón de Login
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height * 0.05),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción de login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: Color.fromARGB(255, 65, 131, 143),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.lilitaOne(
                          fontSize: 16,
                          color: Color.fromARGB(255, 65, 131, 143),
                        ),
                      ),
                    ),
                  ),

                    SizedBox(height: 80),

                  // Separador verde
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(color: Color.fromARGB(255, 65, 131, 143), thickness: 2, indent: 40, endIndent: 10)),
                        Text("o bien",
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        Expanded(child: Divider(color: Color.fromARGB(255, 65, 131, 143), thickness: 2, indent: 10, endIndent: 40)),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botones de redes sociales
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(FontAwesomeIcons.facebook, Colors.blue),
                        SizedBox(width: 15),
                        _buildSocialButton(FontAwesomeIcons.google, Colors.red),
                        SizedBox(width: 15),
                        _buildSocialButton(FontAwesomeIcons.apple, Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.grey.shade200,
        padding: EdgeInsets.all(12),
      ),
      child: FaIcon(icon, color: color, size: 24),
    );
  }
}
