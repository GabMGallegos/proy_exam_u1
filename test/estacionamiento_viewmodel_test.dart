import 'package:flutter_test/flutter_test.dart';
import 'package:proy_exam_u1/viewmodels/estacionamiento_viewmodel.dart';

void main() {
  test(
    'Tarifas y descuento para ambos vehículos en el límite de cinco horas',
    () {
      final vm = EstacionamientoViewModel();
      for (final tipo in ['Automóvil', 'Motocicleta']) {
        vm.seleccionarTipo(tipo);
        final tarifa = tipo == 'Automóvil' ? 1.0 : 0.5;
        for (final horas in [1, 5, 6]) {
          final resultado = vm.calcular(horas);
          final subtotal = horas * tarifa;
          final descuento = horas > 5 ? subtotal * 0.1 : 0.0;
          expect(resultado.tipoVehiculo, tipo);
          expect(resultado.horas, horas);
          expect(resultado.tarifa, tarifa);
          expect(resultado.subtotal, closeTo(subtotal, 0.00001));
          expect(resultado.descuento, closeTo(descuento, 0.00001));
          expect(resultado.total, closeTo(subtotal - descuento, 0.00001));
        }
      }
      expect(vm.calcular(6).total, closeTo(2.7, 0.00001));
    },
  );

  test('El cambio de vehículo notifica a la vista', () {
    final vm = EstacionamientoViewModel();
    var avisos = 0;
    vm.addListener(() => avisos++);
    vm.seleccionarTipo('Motocicleta');
    expect(vm.tipoVehiculo, 'Motocicleta');
    expect(avisos, 1);
    vm.dispose();
  });
}
