import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/ui/cards/tarjeta_datos_usuario.dart';

import '../../static/colors.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key, required this.title});
  final String title;

  @override
  State<PaginaPrincipal> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: ColoresApp.colorVerdeCeiba,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...List.generate(5, (index) => TarjetaUsuario()).toList()
            ],
          ),
        ),
      ),
    );
  }
}
