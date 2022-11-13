import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_ceiba_flutter/repositorio/model/usuario.dart';

import '../../repositorio/api.dart';

part 'usuarios_event.dart';
part 'usuarios_state.dart';

///Bloc para el manejo de carga de usuarios en la pantalla principal
class UsuariosBloc extends Bloc<UsuariosEvent, UsuariosState> {
  List<ModeloUsuario> listadoUsuarios = List.empty(growable: true);
  UsuariosBloc() : super(UsuariosCargando()) {
    on<CargarUsuarios>(_onCargarUsuarios);
    on<FiltrarUsuarios>(_onFiltrarUsuarios);
  }

  Future<void> _onFiltrarUsuarios(
    FiltrarUsuarios event,
    Emitter<UsuariosState> emit,
  ) async {
    if (event.textoFiltro.isEmpty) {
      emit(UsuariosCargados(listadoUsuarios, false));
    } else {
      List<ModeloUsuario> listadoBusqueda = listadoUsuarios
          .where((element) => element.nombre!
              .toLowerCase()
              .contains(event.textoFiltro.toLowerCase()))
          .toList();
      if (listadoBusqueda.isEmpty) {
        emit(UsuariosVacios());
      } else {
        emit(UsuariosCargados(listadoBusqueda, false));
      }
    }
  }

  Future<void> _onCargarUsuarios(
    CargarUsuarios event,
    Emitter<UsuariosState> emit,
  ) async {
    emit(UsuariosCargando());

    http.Response? respuesta;
    //consumos el servicios
    respuesta = await ApiServicios().traerListadoUsuarios();

    //analizamos la respuesta
    if (respuesta != null) {
      if (respuesta.statusCode == HttpStatus.ok) {
        //usuarios cargados exitosamente, procesamos la lista
        try {
          var listadoJson = jsonDecode(respuesta.body) as List;

          for (var e in listadoJson) {
            ModeloUsuario usuario = ModeloUsuario.fromJson(e);
            listadoUsuarios.add(usuario);
          }
          //enviando usuarios mapeados a la interfaz
          emit(UsuariosCargados(listadoUsuarios, true));
          return;
        } catch (e) {
          //ocurrio un error al mapear los usuarios
          emit(UsuariosError());
          return;
        }
      }
    }
    //ocurrio un error al realizar la peticion
    emit(UsuariosError());
  }
}
