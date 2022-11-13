import 'package:flutter/material.dart';

import '../../static/colors.dart';

class FilaDatosUsuario extends StatelessWidget {
  final IconData icono;
  final String texto;
  const FilaDatosUsuario({super.key, required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
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
