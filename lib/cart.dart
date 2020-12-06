import 'package:flutter/material.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'package:t1_inf1300/StyledListTile.dart';
import 'package:t1_inf1300/StyledRaisedButtonLong.dart';
import 'controller/controller.dart';
import 'package:provider/provider.dart';

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
  Controller controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<Controller>(context);
    locale = controller.locale;

    this.totalLabelText = "Total: ";

    getProducts();

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

  void getProducts() {
    controller.products.forEach((element) => {this._products.add(element)});
    print(this._products.length);
    setState(() {});
  }

  _buildRow(int index) {
    return StyledListTile(
        title: this._products[index].name,
        subtitle: this._products[index].description,
        leading: "",
        trailing: "RS " + this._products[index].price);
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
