import 'package:flutter/material.dart';

import '../../modelos/estacionamiento_modelo.dart';

// View de MVVM: muestra el resultado sin repetir la lógica del VM.
class ResultadoPantalla extends StatelessWidget {
  ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera el modelo enviado mediante arguments.
    final resultado =
        ModalRoute.of(context)!.settings.arguments as EstacionamientoModelo;
    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: DefaultTextStyle.merge(
            textAlign: TextAlign.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Vehículo: ${resultado.tipoVehiculo}'),
                Text('Horas: ${resultado.horas}'),
                Text(
                  'Tarifa aplicada: \$${resultado.tarifa.toStringAsFixed(2)} por hora',
                ),
                Text('Subtotal: \$${resultado.subtotal.toStringAsFixed(2)}'),
                Text(
                  'Descuento (${resultado.horas > 5 ? 10 : 0} %): \$${resultado.descuento.toStringAsFixed(2)}',
                ),
                SizedBox(height: 20),
                Text(
                  'Total a pagar: \$${resultado.total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Para mostrar otro dato del modelo, agrega aquí un Text.
                SizedBox(height: 20),
                ElevatedButton(
                  // pop vuelve al formulario conservando sus datos.
                  onPressed: () => Navigator.pop(context),
                  child: Text('Volver'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
