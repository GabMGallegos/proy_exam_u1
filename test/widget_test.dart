import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proy_exam_u1/main.dart';
import 'package:proy_exam_u1/vista/pantallas/inicio_pantalla.dart';
import 'package:proy_exam_u1/vista/pantallas/estacionamiento_pantalla.dart';
import 'package:proy_exam_u1/vista/pantallas/resultado_pantalla.dart';

void main() {
  testWidgets('Tres pantallas, selección con Provider, arguments y regreso', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(InicioPantalla), findsOneWidget);
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(
      app.routes!.keys,
      unorderedEquals(['/', '/principal', '/resultado']),
    );
    await tester.tap(find.text('Seguir'));
    await tester.pumpAndSettle();
    expect(find.byType(EstacionamientoPantalla), findsOneWidget);
    await tester.enterText(find.byType(TextField), '6');
    await tester.tap(find.text(r'Motocicleta: $0,50 por hora'));
    await tester.pump();
    final grupo = tester.widget<RadioGroup<String>>(
      find.byType(RadioGroup<String>),
    );
    expect(grupo.groupValue, 'Motocicleta');
    await tester.tap(find.text('Calcular'));
    await tester.pumpAndSettle();
    expect(find.byType(ResultadoPantalla), findsOneWidget);
    expect(find.text('Vehículo: Motocicleta'), findsOneWidget);
    expect(find.text(r'Tarifa aplicada: $0.50 por hora'), findsOneWidget);
    expect(find.text(r'Descuento (10 %): $0.30'), findsOneWidget);
    expect(find.text(r'Total a pagar: $2.70'), findsOneWidget);
    await tester.tap(find.text('Volver'));
    await tester.pumpAndSettle();
    expect(find.text('6'), findsOneWidget);
    await tester.tap(find.byTooltip('Limpiar campos'));
    await tester.pump();
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      isEmpty,
    );
    expect(
      tester
          .widget<RadioGroup<String>>(find.byType(RadioGroup<String>))
          .groupValue,
      'Automóvil',
    );
    await tester.enterText(find.byType(TextField), '5');
    await tester.tap(find.text(r'Automóvil: $1,00 por hora'));
    await tester.pump();
    await tester.tap(find.text('Calcular'));
    await tester.pumpAndSettle();
    expect(find.text(r'Descuento (0 %): $0.00'), findsOneWidget);
    expect(find.text(r'Total a pagar: $5.00'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(InicioPantalla), findsOneWidget);
  });

  testWidgets('Acepta horas enteras y rechaza decimales', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Seguir'));
    await tester.pumpAndSettle();
    for (final entrada in [
      '',
      'abc',
      '-1',
      '0',
      'NaN',
      'Infinity',
      '5.5',
      '5,5',
    ]) {
      await tester.enterText(find.byType(TextField), entrada);
      await tester.tap(find.text('Calcular'));
      await tester.pump();
      expect(find.byType(EstacionamientoPantalla), findsOneWidget);
      expect(find.byType(ResultadoPantalla), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
    }
    await tester.enterText(find.byType(TextField), '5');
    await tester.tap(find.text('Calcular'));
    await tester.pumpAndSettle();
    expect(find.text('Horas: 5'), findsOneWidget);
    expect(find.text(r'Total a pagar: $5.00'), findsOneWidget);
  });
}
