import 'package:flutter/material.dart';

class DialogCargando extends StatelessWidget {
  const DialogCargando({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
    );
  }
}
