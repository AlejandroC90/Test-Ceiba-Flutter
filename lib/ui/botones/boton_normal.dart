import 'package:flutter/material.dart';

class BotonNormal extends StatelessWidget {
  final String texto;
  final VoidCallback funcion;
  const BotonNormal({super.key, required this.texto, required this.funcion});

  @override
  Widget build(BuildContext context) {
    return TextButton(
                    onPressed: funcion, child: Text(texto));
  }
}
