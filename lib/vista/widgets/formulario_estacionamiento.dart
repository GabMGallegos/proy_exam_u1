import 'package:flutter/material.dart';

import 'campo_numero.dart';
import 'option_button.dart';

class FormularioEstacionamiento extends StatelessWidget {
  final TextEditingController horasController;
  final String seleccionado;
  final ValueChanged<String> onTipoChanged;
  final VoidCallback onCalcular;

  FormularioEstacionamiento({
    super.key,
    required this.horasController,
    required this.seleccionado,
    required this.onTipoChanged,
    required this.onCalcular,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CampoNumero(
          etiqueta: 'Horas de permanencia',
          controller: horasController,
        ),
        // Para otro campo, agrégalo aquí y recibe su controller arriba.
        SizedBox(height: 20),
        Text('Tipo de vehículo', textAlign: TextAlign.center),
        RadioGroup<String>(
          groupValue: seleccionado,
          onChanged: (valor) {
            if (valor != null) onTipoChanged(valor);
          },
          child: Column(
            children: [
              OptionButton(
                titulo: 'Automóvil: \$1,00 por hora',
                valor: 'Automóvil',
              ),
              OptionButton(
                titulo: 'Motocicleta: \$0,50 por hora',
                valor: 'Motocicleta',
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text('Más de 5 horas: 10 % de descuento.', textAlign: TextAlign.center),
        SizedBox(height: 20),
        ElevatedButton(onPressed: onCalcular, child: Text('Calcular')),
      ],
    );
  }
}
