part of 'usuarios_bloc.dart';

@immutable
abstract class UsuariosState {}

class UsuariosCargando extends UsuariosState {}

class UsuariosCargados extends UsuariosState {}

class UsuariosError extends UsuariosState {}
