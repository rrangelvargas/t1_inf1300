import 'package:flutter/material.dart';
import 'package:t1_inf1300/newrequestfragment.dart';
import 'package:t1_inf1300/MyOrders.dart';
import 'package:t1_inf1300/main.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Novo Pedido";
  String menuLabelText = "";
  String newOrderLabelText = "";
  String myOrdersLabelText = "";
  String exitLabelText = "";
  String locale = "";
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    locale = Platform.localeName.substring(0, 2);

    if (locale == "pt") {
      this.title = "Novo Pedido";
      this.menuLabelText = "Menu";
      this.newOrderLabelText = "Novo Pedido";
      this.myOrdersLabelText = "Meus Pedidos";
      this.exitLabelText = "Sair";
    } else if (locale == "es") {
      this.title = "Nuevo Pedido";
      this.menuLabelText = "Menú";
      this.newOrderLabelText = "Nuevo Pedido";
      this.myOrdersLabelText = "Mis Pedidos";
      this.exitLabelText = "Sal";
    } else {
      this.title = "New Order";
      this.menuLabelText = "Menu";
      this.newOrderLabelText = "New Order";
      this.myOrdersLabelText = "My Orders";
      this.exitLabelText = "Exit";
    }

    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: _getDrawerItem(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(this.menuLabelText),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(this.newOrderLabelText),
              onTap: () {
                _onSelectItem(0, this.newOrderLabelText);
              },
            ),
            ListTile(
              title: Text(this.myOrdersLabelText),
              onTap: () {
                _onSelectItem(1, this.myOrdersLabelText);
              },
            ),
            // ListTile(
            //   title: Text('Perfil'),
            //   onTap: () {
            //     _onSelectItem(2);
            //   },
            // ),
            ListTile(
              title: Text(this.exitLabelText),
              onTap: () {
                _logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return new NewRequest();
      case 1:
        return new MyOrders();
      case 2:
        return;
      case 3:
        return;
    }
  }

  _onSelectItem(int index, String title) {
    setState(() => {_selectedIndex = index});
    setState(() => {this.title = title});
    Navigator.of(context).pop();
  }

  _logout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => new MyApp()),
        (Route<dynamic> route) => false);
  }
}
