import 'package:flutter/material.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'dart:io';
import 'controller/controller.dart';

class AddProduct extends StatefulWidget {
  final Product product;
  AddProduct({this.product});

  @override
  _AddProductState createState() => new _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String addItemLabelText = "";
  String cancelLabelText = "";
  String pharmacyLabelText = "";
  String quantityLabelText = "";
  String locale = "";

  int _quantity = 0;

  final controller = Controller();

  void _addQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _removeQuantity() {
    setState(() {
      _quantity <= 0 ? _quantity = 0 : _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    locale = controller.locale;

    if (locale == "pt") {
      this.addItemLabelText = "Adicionar";
      this.cancelLabelText = "Cancelar";
      this.pharmacyLabelText = "Farmácia";
      this.quantityLabelText = "Quantidade:";
    } else if (locale == "es") {
      this.addItemLabelText = "Añadir";
      this.cancelLabelText = "Cancelar";
      this.pharmacyLabelText = "Farmacia";
      this.quantityLabelText = "Cantidad:";
    } else {
      this.addItemLabelText = "Add";
      this.cancelLabelText = "Cancel";
      this.pharmacyLabelText = "Pharmacy";
      this.quantityLabelText = "Quantity:";
    }

    Widget addButton = FlatButton(
      child: Text(this.addItemLabelText),
      onPressed: () {
        if (_quantity > 0) {
          controller.addProduct(widget.product);
          Navigator.pop(context);
        }
      },
    );

    Widget cancelaButton = FlatButton(
      child: Text(this.cancelLabelText),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    var height = MediaQuery.of(context).size.height * 0.4;
    var width = MediaQuery.of(context).size.width * 0.3;

    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image(
                    image: NetworkImage(widget.product.image),
                    width: 50,
                    height: 50,
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.product.name),
                      Text(this.pharmacyLabelText)
                    ],
                  )
                ],
              ),
              Text(widget.product.description),
              Row(
                children: <Widget>[
                  Text(this.quantityLabelText),
                  IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: _removeQuantity),
                  Text('$_quantity'),
                  IconButton(
                      icon: Icon(Icons.add_circle), onPressed: _addQuantity),
                ],
              )
            ],
          ),
        ),
        actions: [cancelaButton, addButton]);
  }
}
