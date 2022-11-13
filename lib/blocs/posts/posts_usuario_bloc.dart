import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_ceiba_flutter/repositorio/model/post.dart';

import '../../repositorio/api.dart';

part 'posts_usuario_event.dart';
part 'posts_usuario_state.dart';

class PostsUsuarioBloc extends Bloc<PostsUsuarioEvent, PostsUsuarioState> {
  PostsUsuarioBloc() : super(PostsUsuarioCargando()) {
    on<CargarPostsUsuario>(_onCargarPosts);
  }
  Future<void> _onCargarPosts(
    CargarPostsUsuario event,
    Emitter<PostsUsuarioState> emit,
  ) async {
    emit(PostsUsuarioCargando());

    http.Response? respuesta;
    //consumos el servicios
    respuesta = await ApiServicios()
        .traerListadoPostsPorUsuario(event.idUsuario.toString());

    //analizamos la respuesta
    if (respuesta != null) {
      if (respuesta.statusCode == HttpStatus.ok) {
        //usuarios cargados exitosamente, procesamos la lista
        try {
          var listadoJson = jsonDecode(respuesta.body) as List;
          List<ModeloPost> listadoPosts = List.empty(growable: true);

          for (var e in listadoJson) {
            ModeloPost post = ModeloPost.fromJson(e);
            listadoPosts.add(post);
          }
          //enviando usuarios mapeados a la interfaz
          emit(PostsUsuarioCargados(listadoPosts));
          return;
        } catch (e) {
          //ocurrio un error al mapear los usuarios
          emit(PostsUsuarioError());
          return;
        }
      }
    }
    //ocurrio un error al realizar la peticion
    emit(PostsUsuarioError());
  }
}
