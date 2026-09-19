import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      )
    );
  }
}

class ListaTransferencias extends StatelessWidget {

  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferencia('Pindamonhangaba', 1000.0));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 97, 224),
        title: const Text("Cabecinha de Guidão"),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        }
        
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push<Transferencia>(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((tranferenciaRecebida){
            debugPrint('Chegou no then do future');
            debugPrint('$tranferenciaRecebida');
            if(tranferenciaRecebida != null){
              _transferencias.add(tranferenciaRecebida);
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.item),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final String item;

  Transferencia(this.item, this.valor);

  @override
  String toString() => 'Transferencia{item: $item, valor: $valor}';
}

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({super.key});

  final TextEditingController _controladorCampoItem = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 97, 224),
        title: const Text('Primeiro formulário'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoItem,
            rotulo: 'Item',
            dica: 'Qual item?',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: 'Qual o valor?',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            child: const Text("Confirmar"),
            onPressed: () {
              _criaTransferencia(context);
            },
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    debugPrint('Clicou no confirmar');
    final String item = _controladorCampoItem.text;
    final double valor = double.tryParse(_controladorCampoValor.text) ?? 0.0;

    if (item.isNotEmpty && valor > 0) {
      final transferenciaCriada = Transferencia(item, valor);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});
  //Colocar alguma propriedade fora das {} pode fazer um construtor nomeado e automaticamente obrigatorio

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          labelStyle: TextStyle(color: Colors.black),
          hintText: dica,
        ),
      ),
    );
  }
}
