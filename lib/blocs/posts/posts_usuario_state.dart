part of 'posts_usuario_bloc.dart';

@immutable
abstract class PostsUsuarioState {}

class PostsUsuarioCargando extends PostsUsuarioState {}

class PostsUsuarioCargados extends PostsUsuarioState {
  final List<ModeloPost> listadoPosts;

  PostsUsuarioCargados(this.listadoPosts);
}

class PostsUsuarioError extends PostsUsuarioState {}
