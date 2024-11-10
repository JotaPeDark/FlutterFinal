import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000/diario';

  // Método GET - para obter todos os registros do diário
  Future<List<Map<String, dynamic>>> getAllRegistros() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) {
        return {
          "id": item['id'].toString(),
          "nome": item['nome'],
          "data": item['data'],
          "emocao": item['emocao'],
          "sentimentos": item['sentimentos'],
          "observacoes": item['observacoes'],
          "valor": item['valor']
        };
      }).toList();
    } else {
      throw Exception("Erro ao buscar registros do diário");
    }
  }

  // Método POST - para criar um novo registro no diário
  Future<void> createRegistro(Map<String, dynamic> registro) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(registro),
    );
    if (response.statusCode != 201) {
      throw Exception("Erro ao criar registro");
    }
  }

  // Método PUT - para atualizar um registro existente
  Future<void> updateRegistro(String id, Map<String, dynamic> registro) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(registro),
    );
    if (response.statusCode != 200) {
      throw Exception("Erro ao atualizar registro");
    }
  }

  // Método DELETE - para excluir um registro
  Future<void> deleteRegistro(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception("Erro ao excluir registro");
    }
  }
}
