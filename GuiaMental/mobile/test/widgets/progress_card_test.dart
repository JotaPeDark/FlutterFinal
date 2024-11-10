import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/widgets/progress_card.dart'; // Certifique-se de que o caminho está correto

void main() {
  testWidgets('ProgressCard displays title, description, and progress correctly', (WidgetTester tester) async {
    // Crie o widget ProgressCard com parâmetros
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ProgressCard(
          title: 'Progresso da Emoção',
          description: 'Acompanhe como tem se sentido ao longo da jornada.',
          progress: 0.75,
        ),
      ),
    ));

    // Verifique se o título é exibido
    expect(find.text('Progresso da Emoção'), findsOneWidget);
    // Verifique se a descrição é exibida
    expect(find.text('Acompanhe como tem se sentido ao longo da jornada.'), findsOneWidget);
    // Verifique se o progresso está correto (indicado pela porcentagem)
    expect(find.text('75% concluído'), findsOneWidget);
  });
}
