import 'package:flutter/material.dart';

import '../modelos/estacionamiento_modelo.dart';

class EstacionamientoViewModel extends ChangeNotifier {
  String tipoVehiculo = 'Automóvil';

  void seleccionarTipo(String tipo) {
    tipoVehiculo = tipo;
    notifyListeners();
  }

  EstacionamientoModelo calcular(int horas) {
    final tarifa = tipoVehiculo == 'Automóvil' ? 1.0 : 0.50;
    final subtotal = horas * tarifa;
    final descuento = horas > 5 ? subtotal * 0.10 : 0.0;
    return EstacionamientoModelo(
      horas: horas,
      tipoVehiculo: tipoVehiculo,
      tarifa: tarifa,
      subtotal: subtotal,
      descuento: descuento,
      total: subtotal - descuento,
    );
  }
}
