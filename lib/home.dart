import 'package:flutter/material.dart';
import 'package:t1_inf1300/newrequestfragment.dart';
import 'package:t1_inf1300/MyOrders.dart';
import 'package:t1_inf1300/main.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Novo Pedido';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _getDrawerItem(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Novo Pedido'),
              onTap: () {
                _onSelectItem(0, 'Novo Pedido');
              },
            ),
            ListTile(
              title: Text('Meus Pedidos'),
              onTap: () {
                _onSelectItem(1, 'Meus Pedidos');
              },
            ),
            // ListTile(
            //   title: Text('Perfil'),
            //   onTap: () {
            //     _onSelectItem(2);
            //   },
            // ),
            ListTile(
              title: Text('Sair'),
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
