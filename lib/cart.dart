import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart();

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Item 1 x2'),
            leading: Icon(Icons.label),
            trailing: Text('20,00'),
          ),
          ListTile(
            title: Text('Item 2 x1'),
            leading: Icon(Icons.label),
            trailing: Text('13,00'),
          ),
          ListTile(
            title: Text('Item 3 x1'),
            leading: Icon(Icons.label),
            trailing: Text('8,00'),
          ),
          ListTile(
            title: Text('Item 4 x3'),
            leading: Icon(Icons.label),
            trailing: Text('21,00'),
          ),
          RaisedButton(
            onPressed: () {},
            child: const Text('Total: 62,00 - Finalizar compra',
                style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
