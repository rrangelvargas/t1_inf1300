import 'package:flutter/material.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'package:t1_inf1300/StyledListTile.dart';
import 'package:t1_inf1300/StyledRaisedButtonLong.dart';
import 'controller/controller.dart';
import 'package:provider/provider.dart';
import 'package:t1_inf1300/localizations.dart';

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

    getProducts();

    return Scaffold(
        appBar: AppBar(
          title: Text(MyLocalizations.of(context).translate("cart")),
        ),
        body: ListView.builder(
            itemCount: this._products.length,
            itemBuilder: (context, index) => this._buildRow(index)),
        persistentFooterButtons: <Widget>[
          StyledRaisedButtonLong(
              title: MyLocalizations.of(context).translate("total") +
                  _getTotalPrice() +
                  MyLocalizations.of(context).translate("checkout"),
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
