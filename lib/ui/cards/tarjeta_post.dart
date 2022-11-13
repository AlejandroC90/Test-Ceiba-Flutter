import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/repositorio/model/post.dart';

import '../../static/colors.dart';

///Tarjeta que se muestra con los datos de un post
///recibe un Modelo de tipo post
class TarjetaPost extends StatelessWidget {
  final ModeloPost modeloPost;
  const TarjetaPost({super.key, required this.modeloPost});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                modeloPost.title!,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColoresApp.colorVerdeCeiba,
                    fontWeight: FontWeight.bold),
              ),
              Text(modeloPost.body!)
            ],
          ),
        ),
      ),
    );
  }
}
