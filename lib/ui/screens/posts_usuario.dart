import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ceiba_flutter/blocs/posts/posts_usuario_bloc.dart';
import 'package:prueba_ceiba_flutter/repositorio/model/usuario.dart';
import 'package:prueba_ceiba_flutter/ui/cards/tarjeta_post.dart';

import '../../static/colors.dart';
import '../dialogs/dialog_cargando.dart';

class PostsUsuario extends StatelessWidget {
  final ModeloUsuario usuario;
  const PostsUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostsUsuarioBloc()..add(CargarPostsUsuario(usuario.id!)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(usuario.nombre!),
          backgroundColor: ColoresApp.colorVerdeCeiba,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<PostsUsuarioBloc, PostsUsuarioState>(
                  listener: (context, state) {
                    if (state is PostsUsuarioCargando) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: ((context) {
                            return const DialogCargando();
                          }));
                    } else if (state is PostsUsuarioError) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Ha ocurrido un error..."),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    if (state is PostsUsuarioCargados) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ...state.listadoPosts
                              .map((u) => TarjetaPost(modeloPost: u)),
                        ],
                      );
                    } else if (state is PostsUsuarioError) {
                      return Center(
                        child: ElevatedButton(
                            onPressed: (() => context
                                .read<PostsUsuarioBloc>()
                                .add(CargarPostsUsuario(usuario.id!))),
                            child: const Text("Volver a cargar")),
                      );
                    } else {
                      return Container();
                    }
                  },
                ))),
      ),
    );
  }
}
