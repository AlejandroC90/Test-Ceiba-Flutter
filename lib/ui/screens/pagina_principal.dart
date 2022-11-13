import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ceiba_flutter/blocs/usuarios/usuarios_bloc.dart';
import 'package:prueba_ceiba_flutter/ui/cards/tarjeta_datos_usuario.dart';
import 'package:prueba_ceiba_flutter/ui/dialogs/dialog_cargando.dart';

import '../../static/colors.dart';

///Paginal principal donde se muestra el listado de los usuarios
class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key, required this.title});
  final String title;

  @override
  State<PaginaPrincipal> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PaginaPrincipal> {
  final TextEditingController controladorBusqueda = TextEditingController();
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
          child: BlocConsumer<UsuariosBloc, UsuariosState>(
            listener: (context, state) {
              if (state is UsuariosCargando) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: ((context) {
                      return const DialogCargando();
                    }));
              } else if (state is UsuariosCargados) {
                if (state.cerrarCargando) {
                  Navigator.of(context).pop();
                }
              } else if (state is UsuariosError) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              if (state is UsuariosCargados) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    busqueda(),
                    ...state.listadoUsuarios
                        .map((u) => TarjetaUsuario(modeloUsuario: u)),
                  ],
                );
              } else if (state is UsuariosVacios) {
                return Column(
                  children: [
                    busqueda(),
                    Text(
                      "List is empty",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: ColoresApp.colorVerdeCeiba),
                    )
                  ],
                );
              } else {
                return Center(
                  child: TextButton(
                    child: const Text("Reintentar"),
                    onPressed: () =>
                        context.read<UsuariosBloc>().add(CargarUsuarios()),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget busqueda() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controladorBusqueda,
          decoration: const InputDecoration(labelText: "Buscar Usuario"),
          onChanged: (value) =>
              context.read<UsuariosBloc>().add(FiltrarUsuarios(value)),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
