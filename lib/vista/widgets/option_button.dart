import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String titulo;
  final String valor;

  OptionButton({super.key, required this.titulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(titulo, textAlign: TextAlign.center),
      value: valor,
    );
  }
}
