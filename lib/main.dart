import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Guidao"),
              subtitle: Text("Descrição do Guidao"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Guidao"),
              subtitle: Text("Descrição do Guidao"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Guidao"),
              subtitle: Text("Descrição do Guidao"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Guidao"),
              subtitle: Text("Descrição do Guidao"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 97, 224),
        title: Text("Cabecinha de Guidão"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    ),
  ),
);
