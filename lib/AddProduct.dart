import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';

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
    Widget addButton = FlatButton(
      child: Text("Adicionar"),
      onPressed: () {},
    );

    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {},
    );

    return AlertDialog(
        content: Container(
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
                      Text("Farmacia")
                    ],
                  )
                ],
              ),
              Text(widget.product.description),
              Row(
                children: <Widget>[
                  Text("Quantidade:"),
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

// showAlertDialog3(BuildContext context, Product product) {
//   // configura os botões
//   Widget addButton = FlatButton(
//     child: Text("Adicionar"),
//     onPressed: () {},
//   );
//
//   Widget cancelaButton = FlatButton(
//     child: Text("Cancelar"),
//     onPressed: () {},
//   );

//   AlertDialog alert = AlertDialog(
//       content: Container(
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Image(
//                   image: NetworkImage(product.image),
//                   width: 50,
//                   height: 50,
//                 ),
//                 Column(
//                   children: <Widget>[Text(product.name), Text("Farmacia")],
//                 )
//               ],
//             ),
//             Text(product.description),
//             Row(
//               children: <Widget>[
//                 Text("Quantidade:"),
//                 Icon(Icons.add_circle),
//                 Text("0"),
//                 IconButton(icon: Icon(Icons.remove_circle), onPressed: () {})
//               ],
//             )
//           ],
//         ),
//       ),
//       actions: [cancelaButton, addButton]);
//   // exibe o dialogo
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
