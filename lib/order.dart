import 'package:flutter/material.dart';
import 'file:///C:/Users/tgome/Documents/BitBucket/Flutter/t1_inf1300/lib/model/Product.dart';
import 'package:t1_inf1300/StyledListTile.dart';
import 'dart:io';

class Order extends StatefulWidget {
  Order();

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Product> _products = List<Product>();

  String myOrdersLabelText = "";
  String totalValueLabelText = "";
  String deliveryFeeLabelText = "";
  String locale = "";

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    locale = Platform.localeName.substring(0, 2);

    if (locale == "pt") {
      this.myOrdersLabelText = "Meus pedidos";
      this.totalValueLabelText = "Valor total dos produtos: ";
      this.deliveryFeeLabelText =
          "'\n\nTaxa de entrega: 10.0 \n\nTotal do pedido: ";
    } else if (locale == "es") {
      this.myOrdersLabelText = "Mis pedidos";
      this.totalValueLabelText = "Valor total de productos: ";
      this.deliveryFeeLabelText = "\n\nGastos de envío: 10.0 \n\nTotal: ";
    } else {
      this.myOrdersLabelText = "My Orders";
      this.totalValueLabelText = "Total products' value: ";
      this.deliveryFeeLabelText = "\n\nDelivery Fee: 10.0 \n\nTotal: ";
    }

    var price = _getTotalPrice();
    var temp = double.parse(price) + 10.0;
    var priceWithTax = '$temp';

    return Scaffold(
      appBar: AppBar(
        title: Text(this.myOrdersLabelText),
      ),
      body: ListView.builder(
          itemCount: this._products.length,
          itemBuilder: (context, index) => this._buildRow(index)),
      persistentFooterButtons: <Widget>[
        Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                    this.totalValueLabelText +
                        price +
                        this.deliveryFeeLabelText +
                        priceWithTax,
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onBackground)),
              ),
            ))
      ],
    );
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
    // return ListTile(
    //   title: Text(this._products[index].name),
    //   leading: Text(this._products[index].image),
    //   trailing: Text(this._products[index].price),
    // );
  }

  String _getTotalPrice() {
    var price = 0.0;
    for (var item in this._products) {
      price += double.parse(item.price);
    }
    return "$price";
  }
}
