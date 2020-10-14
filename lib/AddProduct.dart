import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';

showAlertDialog3(BuildContext context, Product product) {
  // configura os botões
  Widget lembrarButton = FlatButton(
    child: Text("Lembrar"),
    onPressed: () {},
  );
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {},
  );
  Widget dispararButton = FlatButton(
    child: Text("Disparar"),
    onPressed: () {},
  );
  // configura o  AlertDialog
  AlertDialog alert = AlertDialog(
    content: Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: NetworkImage(product.image),
                width: 50,
                height: 50,
              ),
              Column(
                children: <Widget>[Text(product.name), Text("Farmacia")],
              )
            ],
          ),
          Text(product.description),
          Row(
            children: <Widget>[
              Text("Quantidade:"),
              Icon(Icons.exposure_plus_1)
            ],
          )
        ],
      ),
    ),
    actions: [
      lembrarButton,
      cancelaButton,
      dispararButton,
    ],
  );
  // exibe o dialogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
