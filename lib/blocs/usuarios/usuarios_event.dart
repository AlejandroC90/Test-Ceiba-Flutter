part of 'usuarios_bloc.dart';

@immutable
abstract class UsuariosEvent {}

class CargarUsuarios extends UsuariosEvent {}

class FiltrarUsuarios extends UsuariosEvent {
  final String textoFiltro;

  FiltrarUsuarios(this.textoFiltro);
}
