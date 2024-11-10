import 'package:flutter/material.dart';
import 'package:mobile/service/api_service.dart';
import 'diario_form.dart';

class DiarioPage extends StatefulWidget {
  @override
  _DiarioPageState createState() => _DiarioPageState();
}

class _DiarioPageState extends State<DiarioPage> {
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> registros = [];

  @override
  void initState() {
    super.initState();
    fetchRegistros();
  }

  void fetchRegistros() async {
    try {
      final data = await apiService.getAllRegistros();
      setState(() {
        registros = data;
      });
    } catch (e) {
      print("Erro ao buscar registros do diário: $e");
    }
  }

  void createRegistro(String nome, double valor, String data, String emocao, String sentimentos, String observacoes) async {
    final registro = {
      'nome': nome,
      'valor': valor,
      'data': data,
      'emocao': emocao,
      'sentimentos': sentimentos,
      'observacoes': observacoes,
    };
    await apiService.createRegistro(registro);
    fetchRegistros();
  }

  void updateRegistro(String id, String nome, double valor, String data, String emocao, String sentimentos, String observacoes) async {
    final registro = {
      'nome': nome,
      'valor': valor,
      'data': data,
      'emocao': emocao,
      'sentimentos': sentimentos,
      'observacoes': observacoes,
    };
    await apiService.updateRegistro(id, registro);
    fetchRegistros();
  }

  void deleteRegistro(String id) async {
    await apiService.deleteRegistro(id);
    fetchRegistros();
  }

  void openAddRegistroForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DiarioForm(
          onSubmit: createRegistro,  // Passando a função `createRegistro`
        ),
      ),
    );
  }

  void openEditRegistroForm(Map<String, dynamic> registro) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DiarioForm(
          registro: registro,
          onSubmit: (nome, valor, data, emocao, sentimentos, observacoes) => updateRegistro(
            registro['id'],  // Passando o `id` para atualização
            nome, valor, data, emocao, sentimentos, observacoes
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia Mental - Diário'),
        backgroundColor: Colors.teal, // Cor mais suave, verde de tranquilidade
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: registros.length,
          itemBuilder: (context, index) {
            final registro = registros[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  registro['nome'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  "Emoção: ${registro['emocao']} - Valor: R\$${registro['valor']}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.orange),
                      onPressed: () => openEditRegistroForm(registro),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteRegistro(registro['id']),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddRegistroForm,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal, // Cor mais suave, verde de tranquilidade
      ),
    );
  }
}
