import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';

class Cart extends StatefulWidget {
  Cart();

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> _products = List<Product>();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: this._products.length,
            itemBuilder: (context, index) => this._buildRow(index)),
        persistentFooterButtons: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Total: ' + _getTotalPrice() + ' - Finalizar compra',
                style: TextStyle(fontSize: 20)),
          ),
        ]);
  }

  void getProducts() async {
    this._products.add(new Product(1, "Item 1", "20.00", "Item 1", "A"));
    this._products.add(new Product(2, "Item 2", "10.00", "Item 2", "B"));
    this._products.add(new Product(3, "Item 3", "18.00", "Item 3", "C"));
    this._products.add(new Product(4, "Item 4", "21.00", "Item 4", "D"));

    setState(() {});
  }

  _buildRow(int index) {
    return ListTile(
      title: Text(this._products[index].name),
      leading: Text(this._products[index].image),
      trailing: Text(this._products[index].price),
    );
  }

  String _getTotalPrice() {
    var price = 0.0;
    for (var item in this._products) {
      price += double.parse(item.price);
    }
    return "$price";
  }
}
