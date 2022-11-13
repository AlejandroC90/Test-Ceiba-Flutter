part of 'usuarios_bloc.dart';

@immutable
abstract class UsuariosState {}

class UsuariosCargando extends UsuariosState {}

class UsuariosCargados extends UsuariosState {
  final List<ModeloUsuario> listadoUsuarios;

  UsuariosCargados(this.listadoUsuarios);
}

class UsuariosError extends UsuariosState {}
