import 'package:flutter/material.dart';
import 'package:t1_inf1300/home.dart';
import 'package:t1_inf1300/model/Cart.dart';
import 'package:t1_inf1300/style/StyledListTile.dart';
import 'package:t1_inf1300/style/StyledRaisedButtonLong.dart';
import 'controller/controller.dart';
import 'package:provider/provider.dart';
import 'package:t1_inf1300/utils/localizations.dart';
import 'package:t1_inf1300/notification/notificationManager.dart';

NotificationManager n = new NotificationManager();

class CartView extends StatefulWidget {
  CartView();

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartView> {
  List<Cart> _products = List<Cart>();

  String cartLabelText = "";
  String totalLabelText = "";
  String checkoutLabelText = "";
  String locale = "";
  Controller controller;

  @override
  void initState() {
    super.initState();
    n.initializing();
  }

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
    controller.cart.forEach((element) => {this._products.add(element)});
    print(this._products.length);
    setState(() {});
  }

  _buildRow(int index) {
    return StyledListTile(
        title: this._products[index].product.name,
        subtitle: this._products[index].product.description,
        leading: this._products[index].quantity.toString(),
        trailing: "RS " + this._products[index].product.price);
  }

  String _getTotalPrice() {
    var price = 0.0;
    for (var item in this._products) {
      price += double.parse(item.product.price) * item.quantity;
    }
    return "$price";
  }

  void _finishBuy() {
    controller.addToOrder();
    _notificate(MyLocalizations.of(context).translate("orderSuccessfully"),
        MyLocalizations.of(context).translate("orderSuccessfullyDescription"));
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
  }

  void _notificate(String title, String description) async {
    await n.notification(title, description);
  }
}
