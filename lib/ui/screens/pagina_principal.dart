import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ceiba_flutter/blocs/usuarios/usuarios_bloc.dart';
import 'package:prueba_ceiba_flutter/ui/cards/tarjeta_datos_usuario.dart';

import '../../static/colors.dart';

///Paginal principal donde se muestra el listado de los usuarios
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
          child: BlocBuilder<UsuariosBloc, UsuariosState>(
            builder: (context, state) {
              if (state is UsuariosCargados) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ...state.listadoUsuarios
                        .map((u) => TarjetaUsuario(modeloUsuario: u)),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Cargando..."),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
