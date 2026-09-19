import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: FormularioTransferencia()));
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 97, 224),
        title: const Text("Cabecinha de Guidão"),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia("Rolinha quadrada", 50)),
          ItemTransferencia(Transferencia("Cabeça triangular", 1500)),
          ItemTransferencia(Transferencia("Cuzinho descascado", 14)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
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
}


class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 97, 224),
        title: const Text('Primeiro formulário'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                labelText: "Item",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                hintText: "Cachorra aguada",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Valor",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                hintText: "501",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: const Text("Confirmar"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

