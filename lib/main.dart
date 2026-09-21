import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 180, 89, 5),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 180, 89, 5),
          foregroundColor: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 180, 89, 5),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cabecinha de Guidão"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push<Transferencia>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );

          future.then((tranferenciaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              if (tranferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(tranferenciaRecebida);
                });
              }
            });
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

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoItem = TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeiro formulário'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            ElevatedButton(
              child: const Text("Confirmar"),
              onPressed: () {
                _criaTransferencia(context);
              },
            ),
          ],
        ),
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
  final TextInputType? keyboardType;

  Editor({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        keyboardType: keyboardType,
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