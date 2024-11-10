import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_button.dart';
import 'package:mobile/widgets/progress_card.dart';
import 'package:mobile/screens/diario_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo ao Guia Mental!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Aqui você pode acompanhar seu progresso e explorar seu diário.', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ProgressCard(
              title: 'Progresso da Emoção',
              description: 'Acompanhe como tem se sentido ao longo da jornada.',
              progress: 0.75,
            ),
            SizedBox(height: 20),
            CustomButton(
              label: 'Ir para o Diário',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiarioPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Guia Mental',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Diário'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiarioPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
