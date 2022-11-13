import 'package:flutter/material.dart';

import '../../static/colors.dart';
///Widget de boton de aplicacion
class BotonNormal extends StatelessWidget {
  final String texto;
  final VoidCallback funcion;
  const BotonNormal({super.key, required this.texto, required this.funcion});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: funcion,
        child: Text(
          texto,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: ColoresApp.colorVerdeCeiba, fontWeight: FontWeight.bold),
        ));
  }
}
