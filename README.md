# Ejercicio 5: costo de estacionamiento

Aplicación sencilla con MVVM y Provider, siguiendo el estilo de proy07.
Solo implementa el ejercicio 5 del examen.

- `modelos`: datos y resultado.
- `viewmodels`: estado del vehículo, cálculo y `notifyListeners()`.
- `vista/pantallas`: exactamente tres pantallas: inicio, principal y resultados.
- `vista/widgets`: componentes de diseño atómico como apoyo a MVVM.

`ChangeNotifierProvider` comparte el VM. La vista usa `context.read()` para
calcular y `context.watch()` para actualizar la selección del vehículo.
Las rutas `/`, `/principal` y `/resultado` usan navegación nombrada.
El resultado se pasa mediante `arguments` y se recupera con `ModalRoute`.

Automóvil: $1/h. Motocicleta: $0,50/h. Más de cinco horas: descuento del 10 %
sobre el subtotal. Exactamente cinco horas: sin descuento.
Solo se aceptan horas enteras positivas, como 5 o 6. Se rechazan decimales,
entradas vacías, texto y valores menores o iguales a cero.

Los comentarios del código explican dónde agregar campos y cómo funciona
Provider. El diseño usa etiquetas, tarifas visibles y contenido desplazable
para facilitar el uso en móvil.

```sh
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run -d ID_DEL_DISPOSITIVO_MOVIL
```

El documento pide ejecutar en un dispositivo móvil. Para esa comprobación
se necesita un teléfono conectado o un emulador Android/iOS disponible.

## Verificación realizada

- `flutter analyze`: sin observaciones.
- `flutter test`: cuatro pruebas aprobadas.
- Compilada, instalada y ejecutada en el emulador Android 15 `emulator-5554`.
