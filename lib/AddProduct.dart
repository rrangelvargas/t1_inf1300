import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t1_inf1300/localizations.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'controller/controller.dart';

class AddProduct extends StatefulWidget {
  final Product product;
  AddProduct({this.product});

  @override
  _AddProductState createState() => new _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int _quantity = 0;
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
    final controller = Provider.of<Controller>(context);

    Widget addButton = FlatButton(
      child: Text(MyLocalizations.of(context).translate("addItem")),
      onPressed: () {
        if (_quantity > 0) {
          controller.addToCart(_quantity, widget.product);
          Navigator.pop(context);
        }
      },
    );

    Widget cancelaButton = FlatButton(
      child: Text(MyLocalizations.of(context).translate("cancel")),
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
                      Text(MyLocalizations.of(context).translate("pharmacy"))
                    ],
                  )
                ],
              ),
              Text(widget.product.description),
              Row(
                children: <Widget>[
                  Text(MyLocalizations.of(context).translate("quantity")),
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
