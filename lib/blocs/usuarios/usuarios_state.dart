part of 'usuarios_bloc.dart';

@immutable
abstract class UsuariosState {}

class UsuariosCargando extends UsuariosState {}

class UsuariosCargados extends UsuariosState {
  final List<ModeloUsuario> listadoUsuarios;
  final bool cerrarCargando;

  UsuariosCargados(this.listadoUsuarios, this.cerrarCargando);
}

class UsuariosError extends UsuariosState {}

class UsuariosVacios extends UsuariosState {}
