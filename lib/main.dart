import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/static/colors.dart';
import 'package:prueba_ceiba_flutter/ui/screens/pagina_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String nombre = "Prueba Ceiba Flutter";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nombre,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: ColoresApp.colorVerdeCeiba,
      ),
      home: const PaginaPrincipal(title: nombre),
    );
  }
}
