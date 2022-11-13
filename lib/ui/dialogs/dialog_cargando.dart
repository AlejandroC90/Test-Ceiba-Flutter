import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/static/colors.dart';

class DialogCargando extends StatelessWidget {
  const DialogCargando({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColoresApp.colorVerdeCeiba),
            ),
            SizedBox(height: 10,),
            Text("Espere por favor...")
          ],
        ),
      ),
    );
  }
}
