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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isFormValid = false;

  // Función para verificar si todos los campos están llenos
  void _validateForm() {
    setState(() {
      _isFormValid = _nameController.text.isNotEmpty &&
          _surnameController.text.isNotEmpty &&
          _birthDateController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _termsAccepted &&
          _privacyAccepted;
    });
  }

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
        _validateForm();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _surnameController.addListener(_validateForm);
    _birthDateController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Función para mostrar la ventana emergente con los términos o la política de privacidad
  void _showLegalDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Text(content, style: GoogleFonts.openSans()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cerrar", style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
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
                    _buildTextField("Nombre (s)", controller: _nameController),
                    Text("Ingrese su nombre completo como aparece en su identificación."),

                    _buildSectionTitle("Apellidos"),
                    _buildTextField("Apellidos", controller: _surnameController),
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
                    _buildTextField("Correo electrónico", controller: _emailController),
                    Text("Ingrese un correo electrónico válido, por ejemplo: usuario@ejemplo.com."),

                    _buildSectionTitle("Contraseña"),
                    _buildTextField("Contraseña", obscureText: true, controller: _passwordController),
                    Text("Cree una contraseña segura con al menos 10 caracteres, incluyendo mayúsculas, minúsculas y números."),

                    SizedBox(height: 20),

                    _buildCheckbox("Acepto los ", "Términos y Condiciones", _termsAccepted, (value) {
                      setState(() {
                        _termsAccepted = value!;
                        _validateForm();
                      });
                    }, context, "Términos y Condiciones", _termsText()),

                    _buildCheckbox("Acepto la ", "Política de Privacidad", _privacyAccepted, (value) {
                      setState(() {
                        _privacyAccepted = value!;
                        _validateForm();
                      });
                    }, context, "Política de Privacidad", _privacyText()),

                    SizedBox(height: 20),

                    // Botón Aceptar y continuar
                    Center(
                      child: ElevatedButton(
                        onPressed: _isFormValid
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

  Widget _buildCheckbox(String prefixText, String linkText, bool value, Function(bool?) onChanged, BuildContext context, String title, String content) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF2E5E66),
        ),
        Text(prefixText, style: GoogleFonts.openSans(fontSize: 14)),
        GestureDetector(
          onTap: () => _showLegalDialog(context, title, content),
          child: Text(
            linkText,
            style: GoogleFonts.openSans(fontSize: 14, color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  String _termsText() {
  return "TÉRMINOS Y CONDICIONES\n\n"
         "1. Introducción\n"
         "Bienvenido a Pool&Chill, la plataforma digital que facilita la renta de albercas entre usuarios. Estos términos y condiciones regulan el uso de nuestros servicios y constituyen un acuerdo legalmente vinculante entre el usuario y Pool&Chill.\n\n"
         "Al registrarte y utilizar nuestros servicios, aceptas estos términos en su totalidad. Si no estás de acuerdo con alguna de las disposiciones aquí establecidas, por favor no utilices la plataforma.\n\n"
         "2. Definiciones\n"
         "- Plataforma: Pool&Chill, incluyendo su aplicación móvil y sitio web.\n"
         "- Usuario: Persona que se registra en la plataforma.\n"
         "- Anfitrión: Usuario que publica una alberca para renta.\n"
         "- Arrendatario: Usuario que renta una alberca.\n"
         "- Servicios: Todos los productos y funciones que Pool&Chill ofrece a los usuarios.\n\n"
         "3. Registro y Uso de la Plataforma\n"
         "Para utilizar nuestros servicios, el usuario debe:\n\n"
         "- Tener al menos 18 años de edad.\n"
         "- Proporcionar información personal real, completa y actualizada.\n"
         "- Mantener la confidencialidad de sus credenciales de acceso.\n"
         "- Aceptar y cumplir con los términos y condiciones establecidos.\n\n"
         "El usuario es responsable de toda actividad realizada desde su cuenta.\n\n"
         "4. Protección de Datos y Privacidad\n"
         "La información personal de los usuarios es tratada conforme a nuestro Aviso de Privacidad. No compartimos ni vendemos datos personales a terceros sin consentimiento expreso del usuario, salvo en los casos establecidos por la ley.\n\n"
         "5. Obligaciones del Usuario\n"
         "Los usuarios de Pool&Chill deben:\n\n"
         "- Usar la plataforma de manera ética y responsable.\n"
         "- Respetar los acuerdos de renta y mantener una comunicación adecuada con otros usuarios.\n"
         "- No proporcionar información falsa, engañosa o fraudulenta.\n"
         "- No utilizar la plataforma para actividades ilegales, ofensivas o peligrosas.\n\n"
         "El incumplimiento de estas normas puede resultar en la suspensión o eliminación de la cuenta del usuario.\n\n"
         "6. Reservas, Pagos y Cancelaciones\n\n"
         "**Reservas y Pagos**\n"
         "- Los pagos en Pool&Chill pueden realizarse mediante tarjeta de crédito, débito o métodos electrónicos.\n"
         "- La plataforma emplea sistemas de seguridad avanzados para proteger la información financiera de los usuarios.\n"
         "- Pool&Chill no almacena datos de tarjetas de crédito o débito; todos los pagos son procesados por proveedores de pago certificados.\n\n"
         "**Política de Cancelaciones y Reembolsos**\n"
         "- Las cancelaciones y reembolsos están sujetos a las políticas de cada anfitrión.\n"
         "- Pool&Chill puede intervenir en disputas, pero no garantiza reembolsos fuera de los términos establecidos.\n\n"
         "7. Responsabilidades y Limitaciones\n"
         "- Pool&Chill actúa como intermediario entre anfitriones y arrendatarios, pero no es responsable de la calidad, seguridad o condiciones de las albercas ofrecidas.\n"
         "- Los anfitriones son responsables del mantenimiento, seguridad y cumplimiento de las normativas locales en sus propiedades.\n"
         "- Pool&Chill no es responsable por accidentes, daños, pérdidas o incidentes ocurridos durante la renta.\n\n"
         "8. Modificaciones a los Términos\n"
         "Nos reservamos el derecho de modificar estos términos en cualquier momento. Se notificará a los usuarios sobre cambios importantes mediante la plataforma.\n\n"
         "9. Contacto\n"
         "Para cualquier consulta o duda, contáctanos en pool&chill_support@gmail.com.";
}


  String _privacyText() {
  return "AVISO DE PRIVACIDAD\n\n"
         "1. Responsable del Tratamiento de Datos\n"
         "Pool&Chill es responsable de la recopilación, uso y protección de los datos personales proporcionados por los usuarios.\n\n"
         
         "2. Información Recopilada\n"
         "Recopilamos la siguiente información personal:\n\n"
         "- Nombre completo.\n"
         "- Correo electrónico.\n"
         "- Fecha de nacimiento.\n"
         "- Información de pago (si aplica).\n"
         "- Historial de reservas y transacciones.\n"
         "- Datos de ubicación (si el usuario lo autoriza).\n\n"

         "3. Uso de la Información\n"
         "La información recopilada se usa para:\n\n"
         "- Gestionar cuentas de usuario y autenticación.\n"
         "- Procesar pagos y reservas.\n"
         "- Personalizar la experiencia del usuario en la plataforma.\n"
         "- Enviar notificaciones y comunicaciones relevantes.\n"
         "- Mejorar nuestros servicios.\n\n"

         "4. Seguridad de los Datos\n"
         "Pool&Chill implementa medidas de seguridad estrictas para proteger la información personal de los usuarios contra accesos no autorizados, pérdida, alteración o divulgación indebida.\n\n"
         "No compartimos ni vendemos datos personales a terceros, salvo en los siguientes casos:\n\n"
         "- Para procesar pagos con proveedores certificados.\n"
         "- Para cumplir con obligaciones legales o regulatorias.\n"
         "- Para mejorar nuestros servicios mediante análisis de datos anónimos.\n\n"

         "5. Información Financiera y Pagos\n"
         "- Pool&Chill no almacena datos de tarjetas de crédito o débito.\n"
         "- Los pagos son gestionados por plataformas de pago seguras y certificadas.\n"
         "- La información financiera es protegida mediante encriptación avanzada.\n\n"

         "6. Derechos del Usuario\n"
         "Los usuarios tienen derecho a:\n\n"
         "- Acceder a su información personal.\n"
         "- Solicitar la rectificación de datos incorrectos.\n"
         "- Solicitar la eliminación de su cuenta y datos personales.\n"
         "- Oponerse al tratamiento de sus datos en ciertas circunstancias.\n"
         "- Retirar su consentimiento para el uso de datos personales.\n\n"
         "Para ejercer estos derechos, los usuarios pueden contactar a pool&chill_support@gmail.com.\n\n"

         "7. Uso de Cookies y Tecnologías de Seguimiento\n"
         "Usamos cookies para mejorar la experiencia de navegación y personalizar los servicios. "
         "Los usuarios pueden configurar su navegador para bloquear cookies, aunque esto podría afectar el funcionamiento de la plataforma.\n\n"

         "8. Transferencias Internacionales de Datos\n"
         "En algunos casos, los datos personales pueden ser transferidos y almacenados fuera del país de origen del usuario. "
         "Nos aseguramos de que estas transferencias cumplan con las regulaciones de protección de datos aplicables.\n\n"

         "9. Cambios en el Aviso de Privacidad\n"
         "Nos reservamos el derecho de modificar este aviso de privacidad en cualquier momento. "
         "Los usuarios serán notificados de cambios importantes a través de la plataforma o por correo electrónico.\n\n"

         "10. Contacto\n"
         "Para cualquier consulta relacionada con privacidad y protección de datos, contáctanos en pool&chill_support@gmail.com.";
}


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

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
}
