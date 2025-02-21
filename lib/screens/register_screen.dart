import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart'; // Importamos la pantalla de login

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;
  bool _privacyAccepted = false;

  TextEditingController _birthDateController = TextEditingController();

  // Función para seleccionar la fecha de nacimiento con un calendario
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _birthDateController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cabecera estilo
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, bottom: 30),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 65, 131, 143),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Terminar Registro",
                  style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Nombre Completo"),
                    _buildTextField("Nombre (s)"),
                    Text("Ingrese su nombre completo como aparece en su identificación."),

                    _buildSectionTitle("Apellidos"),
                    _buildTextField("Apellidos"),
                    Text("Ingrese sus apellidos tal como aparecen en su documento oficial."),

                    _buildSectionTitle("Fecha de nacimiento"),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: _buildTextField("AAAA-MM-DD", controller: _birthDateController),
                      ),
                    ),
                    Text("Seleccione su fecha de nacimiento usando el calendario."),

                    _buildSectionTitle("Correo electrónico"),
                    _buildTextField("Correo electrónico"),
                    Text("Ingrese un correo electrónico válido, por ejemplo: usuario@ejemplo.com."),

                    _buildSectionTitle("Contraseña"),
                    _buildTextField("Contraseña", obscureText: true),
                    Text("Cree una contraseña segura con al menos 10 caracteres, incluyendo mayúsculas, minúsculas y números."),

                    SizedBox(height: 20),

                    _buildCheckbox("Acepto los Términos y Condiciones", (value) {
                      setState(() {
                        _termsAccepted = value!;
                      });
                    }, _termsAccepted),

                    _buildCheckbox("Acepto la Política de Privacidad", (value) {
                      setState(() {
                        _privacyAccepted = value!;
                      });
                    }, _privacyAccepted),

                    SizedBox(height: 20),

                    // Botón Aceptar y continuar
                    Center(
                      child: ElevatedButton(
                        onPressed: _termsAccepted &&
                                _privacyAccepted &&
                                _formKey.currentState!.validate()
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  // Lógica de registro
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xFF2E5E66)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          "Aceptar y continuar",
                          style: GoogleFonts.openSans(
                            color: Color(0xFF2E5E66),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Texto "¿Ya tienes cuenta? Inicia sesión"
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "¿Ya tienes cuenta? Inicia sesión",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.black87,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear títulos de secciones
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  // Método para crear campos de texto con validación opcional
  Widget _buildTextField(String hint,
      {bool obscureText = false, TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.openSans(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2E5E66)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2E5E66), width: 2),
          ),
        ),
      ),
    );
  }

  // Método para crear Checkboxes de términos y privacidad
  Widget _buildCheckbox(String text, Function(bool?) onChanged, bool value) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF2E5E66),
        ),
        Expanded(
          child: Text(text, style: GoogleFonts.openSans(fontSize: 14)),
        ),
      ],
    );
  }
}
