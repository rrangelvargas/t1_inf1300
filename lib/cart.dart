import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';
import 'package:t1_inf1300/StyledListTile.dart';
import 'package:t1_inf1300/StyledRaisedButtonLong.dart';
import 'dart:io';

class Cart extends StatefulWidget {
  Cart();

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> _products = List<Product>();

  String cartLabelText = "";
  String totalLabelText = "";
  String checkoutLabelText = "";
  String locale = "";

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    locale = Platform.localeName.substring(0, 2);

    this.totalLabelText = "Total: ";

    if (locale == "pt") {
      this.cartLabelText = "Carrinho";
      this.checkoutLabelText = " - Finalizar compra";
    } else if (locale == "es") {
      this.cartLabelText = "Carro";
      this.checkoutLabelText = " - Revisa";
    } else {
      this.cartLabelText = "Cart";
      this.checkoutLabelText = " - Checkout";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(this.cartLabelText),
        ),
        body: ListView.builder(
            itemCount: this._products.length,
            itemBuilder: (context, index) => this._buildRow(index)),
        persistentFooterButtons: <Widget>[
          StyledRaisedButtonLong(
              title: this.totalLabelText +
                  _getTotalPrice() +
                  this.checkoutLabelText,
              callback: _finishBuy)
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
    return StyledListTile(
        title: this._products[index].name,
        subtitle: this._products[index].description,
        leading: this._products[index].image,
        trailing: this._products[index].price);
  }

  String _getTotalPrice() {
    var price = 0.0;
    for (var item in this._products) {
      price += double.parse(item.price);
    }
    return "$price";
  }

  void _finishBuy() {}
}
