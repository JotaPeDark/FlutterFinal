import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/widgets/custom_button.dart'; // Certifique-se de que o caminho está correto

void main() {
  testWidgets('CustomButton displays label and responds to tap', (WidgetTester tester) async {
    // Defina uma variável para verificar se o botão foi pressionado
    bool buttonPressed = false;

    // Crie o widget CustomButton com um onPressed que altera a variável
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomButton(
          label: 'Ir para o Diário',
          onPressed: () {
            buttonPressed = true;
          },
        ),
      ),
    ));

    // Verifique se o rótulo do botão é exibido corretamente
    expect(find.text('Ir para o Diário'), findsOneWidget);

    // Toque no botão e verifique se a variável 'buttonPressed' foi alterada
    await tester.tap(find.text('Ir para o Diário'));
    await tester.pump();

    expect(buttonPressed, true); // Verifica se o botão foi pressionado corretamente
  });
}
