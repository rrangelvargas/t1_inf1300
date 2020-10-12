import 'package:flutter/material.dart';
import 'package:t1_inf1300/forgotpassword.dart';

class HomePage extends StatefulWidget {
  String title = 'Pharma +';
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _getDrawerItem(_selectedIndex),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Meus Pedidos'),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Meu Perfil'),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                _onSelectItem(3);
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
        return ForgotPassword();
      case 1:
        return;
      case 2:
        return;
      case 3:
        return;
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }
}
