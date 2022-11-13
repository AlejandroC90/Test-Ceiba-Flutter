import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuarios_event.dart';
part 'usuarios_state.dart';

///Bloc para el manejo de carga de usuarios en la pantalla principal
class UsuariosBloc extends Bloc<UsuariosEvent, UsuariosState> {
  UsuariosBloc() : super(UsuariosCargando()) {
    on<CargarUsuarios>(_onCargarUsuarios);
  }

  Future<void> _onCargarUsuarios(
    CargarUsuarios event,
    Emitter<UsuariosState> emit,
  ) async {
    //emit(MostrandoAgregarFormulario());



  }
}
