import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/repositorio/model/usuario.dart';
import 'package:prueba_ceiba_flutter/ui/botones/boton_normal.dart';
import 'package:prueba_ceiba_flutter/ui/screens/posts_usuario.dart';

import '../../static/colors.dart';
import '../util.dart/fila_datos_usuario.dart';

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
            FilaDatosUsuario(
                icono: Icons.phone, texto: modeloUsuario.telefono!),
            FilaDatosUsuario(icono: Icons.email, texto: modeloUsuario.correo!),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotonNormal(
                    texto: "VER PUBLICACIONES",
                    funcion: () {
                      //al presionar el boton nos vamos a la siguiente pantalla
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostsUsuario(usuario: modeloUsuario)),
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
