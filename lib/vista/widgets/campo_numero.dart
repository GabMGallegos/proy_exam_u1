import 'package:flutter/material.dart';

class CampoNumero extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controller;

  CampoNumero({super.key, required this.etiqueta, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: etiqueta,
        hintText: 'Ejemplo: 6',
        border: OutlineInputBorder(),
      ),
    );
  }
}
