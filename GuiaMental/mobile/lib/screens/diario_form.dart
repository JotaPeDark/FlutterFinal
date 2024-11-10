import 'package:flutter/material.dart';

class DiarioForm extends StatefulWidget {
  final Map<String, dynamic>? registro;
  final Function(String, double, String, String, String, String) onSubmit;

  const DiarioForm({Key? key, this.registro, required this.onSubmit}) : super(key: key);

  @override
  _DiarioFormState createState() => _DiarioFormState();
}

class _DiarioFormState extends State<DiarioForm> {
  final _formKey = GlobalKey<FormState>();
  late String nome, emocao, data, sentimentos, observacoes;
  late double valor;

  @override
  void initState() {
    super.initState();
    if (widget.registro != null) {
      nome = widget.registro!['nome'];
      valor = widget.registro!['valor'];
      data = widget.registro!['data'];
      emocao = widget.registro!['emocao'];
      sentimentos = widget.registro!['sentimentos'];
      observacoes = widget.registro!['observacoes'];
    } else {
      nome = '';
      valor = 0.0;
      data = '';
      emocao = '';
      sentimentos = '';
      observacoes = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.registro == null ? 'Adicionar Registro' : 'Editar Registro'),
        backgroundColor: Colors.teal, // Cor mais suave, verde de tranquilidade
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: nome,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                onSaved: (value) => nome = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                initialValue: valor.toString(),
                decoration: InputDecoration(
                  labelText: 'Valor',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => valor = double.tryParse(value ?? '') ?? 0.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valor é obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                initialValue: data,
                decoration: InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                onSaved: (value) => data = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data é obrigatória';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                initialValue: emocao,
                decoration: InputDecoration(
                  labelText: 'Emoção',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                onSaved: (value) => emocao = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Emoção é obrigatória';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                initialValue: sentimentos,
                decoration: InputDecoration(
                  labelText: 'Sentimentos',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                onSaved: (value) => sentimentos = value ?? '',
              ),
              SizedBox(height: 12),
              TextFormField(
                initialValue: observacoes,
                decoration: InputDecoration(
                  labelText: 'Observações',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                onSaved: (value) => observacoes = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    widget.onSubmit(nome, valor, data, emocao, sentimentos, observacoes);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text(
                  widget.registro == null ? 'Adicionar' : 'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
