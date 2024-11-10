import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/dashboard_page.dart'; // Certifique-se de que o caminho está correto

void main() {
  testWidgets('DashboardPage displays the correct UI and navigates correctly', (WidgetTester tester) async {
    // Crie o widget DashboardPage
    await tester.pumpWidget(MaterialApp(
      home: DashboardPage(),
    ));

    // Verifique se o título e texto principal são exibidos
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Bem-vindo ao Guia Mental!'), findsOneWidget);
    expect(find.text('Aqui você pode acompanhar seu progresso e explorar seu diário.'), findsOneWidget);

    // Verifique se o botão "Ir para o Diário" existe
    expect(find.text('Ir para o Diário'), findsOneWidget);

    // Toque no botão e verifique se a navegação para o DiarioPage acontece
    await tester.tap(find.text('Ir para o Diário'));
    await tester.pumpAndSettle();

    // Verifique se o DiárioPage foi exibido
    expect(find.text('Guia Mental - Diário'), findsOneWidget);
  });
}
