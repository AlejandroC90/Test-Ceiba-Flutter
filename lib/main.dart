import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ceiba_flutter/blocs/usuarios/usuarios_bloc.dart';
import 'package:prueba_ceiba_flutter/static/colors.dart';
import 'package:prueba_ceiba_flutter/ui/screens/pagina_principal.dart';

void main() {
  runApp(const MyApp());
}

///Inicio de la aplicacion
class MyApp extends StatelessWidget {
  static const String nombre = "Prueba Ceiba Flutter";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsuariosBloc()..add(CargarUsuarios()),
      child: MaterialApp(
        title: nombre,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: ColoresApp.colorVerdeCeiba,
        ),
        home: const PaginaPrincipal(title: nombre),
      ),
    );
  }
}
