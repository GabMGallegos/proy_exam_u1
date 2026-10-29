import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/estacionamiento_viewmodel.dart';
import 'vista/pantallas/inicio_pantalla.dart';
import 'vista/pantallas/estacionamiento_pantalla.dart';
import 'vista/pantallas/resultado_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider comparte el VM con las vistas y libera su instancia al salir.
    return ChangeNotifierProvider(
      create: (_) => EstacionamientoViewModel(),
      child: MaterialApp(
        title: 'Costo de estacionamiento',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          // Estilo compartido por los encabezados de las tres pantallas.
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Las tres pantallas del examen se registran como rutas nombradas.
        initialRoute: '/',
        routes: {
          '/': (_) => InicioPantalla(),
          '/principal': (_) => EstacionamientoPantalla(),
          '/resultado': (_) => ResultadoPantalla(),
        },
      ),
    );
  }
}
