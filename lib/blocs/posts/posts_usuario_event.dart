part of 'posts_usuario_bloc.dart';

@immutable
abstract class PostsUsuarioEvent {}

class CargarPostsUsuario extends PostsUsuarioEvent {
  final int idUsuario;

  CargarPostsUsuario(this.idUsuario);
}
