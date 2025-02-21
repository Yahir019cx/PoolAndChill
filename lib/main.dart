import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // Importamos la pantalla de login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pool&Chill',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),  // Mostramos la pantalla de login al iniciar
    );
  }
}
