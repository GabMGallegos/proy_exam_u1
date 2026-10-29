import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Costo de estacionamiento',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ingresa las horas y selecciona tu vehículo para conocer el valor a pagar.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/principal'),
                child: Text('Seguir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
