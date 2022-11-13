import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/ui/botones/boton_normal.dart';

import '../../static/colors.dart';

class TarjetaUsuario extends StatelessWidget {
  const TarjetaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nombre Usuario",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: ColoresApp.colorVerdeCeiba),
            ),
            filaDatosUsuario(Icons.phone, "12312312323"),
            filaDatosUsuario(Icons.email, "correo@correo.com"),
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
          color: Colors.green,
        ),
        const SizedBox(width: 5,),
        Text(texto)
      ],
    );
  }
}
