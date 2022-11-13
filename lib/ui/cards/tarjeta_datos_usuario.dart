import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/repositorio/model/usuario.dart';
import 'package:prueba_ceiba_flutter/ui/botones/boton_normal.dart';

import '../../static/colors.dart';

///Tarjeta que se muestra con los datos de cada usuario,
///recibe un Modelo de tipo ModeloUsuario
class TarjetaUsuario extends StatelessWidget {
  final ModeloUsuario modeloUsuario;
  const TarjetaUsuario({super.key, required this.modeloUsuario});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              modeloUsuario.nombre!,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: ColoresApp.colorVerdeCeiba),
            ),
            filaDatosUsuario(Icons.phone, modeloUsuario.telefono!),
            filaDatosUsuario(Icons.email, modeloUsuario.correo!),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotonNormal(texto: "VER PUBLICACIONES", funcion: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget filaDatosUsuario(IconData icono, String texto) {
    return Row(
      children: [
        Icon(
          icono,
          color: ColoresApp.colorVerdeCeiba,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(texto)
      ],
    );
  }
}
