import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/estacionamiento_viewmodel.dart';
import '../widgets/formulario_estacionamiento.dart';

class EstacionamientoPantalla extends StatefulWidget {
  EstacionamientoPantalla({super.key});

  @override
  State<EstacionamientoPantalla> createState() =>
      _EstacionamientoPantallaState();
}

class _EstacionamientoPantallaState extends State<EstacionamientoPantalla> {
  final horasController = TextEditingController();
  // Declara aquí los controllers de los campos que agregues al formulario.

  @override
  void dispose() {
    // Libera también los controllers que agregues.
    horasController.dispose();
    super.dispose();
  }

  void limpiarCampos() {
    horasController.clear();
    context.read<EstacionamientoViewModel>().seleccionarTipo('Automóvil');
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  void calcular() {
    final horas = int.tryParse(horasController.text);
    if (horas == null || horas <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ingrese horas enteras mayores que cero.',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return;
    }
    // read obtiene el VM para ejecutar una acción sin escuchar cambios.
    final vm = context.read<EstacionamientoViewModel>();
    final resultado = vm.calcular(horas);
    // arguments lleva el modelo desde la pantalla principal al resultado.
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    // watch actualiza la vista cuando el VM llama a notifyListeners().
    final vm = context.watch<EstacionamientoViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text('Estacionamiento')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: FormularioEstacionamiento(
            horasController: horasController,
            seleccionado: vm.tipoVehiculo,
            onTipoChanged: vm.seleccionarTipo,
            onCalcular: calcular,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: limpiarCampos,
        tooltip: 'Limpiar campos',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
