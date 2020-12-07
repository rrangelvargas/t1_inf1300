import 'package:flutter/material.dart';
import 'package:t1_inf1300/utils/localizations.dart';
import 'package:t1_inf1300/newrequestfragment.dart';
import 'package:t1_inf1300/MyOrders.dart';
import 'package:t1_inf1300/main.dart';
import 'package:t1_inf1300/initialize_i18n.dart' show initializeI18n;

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Novo Pedido";
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    this.title = MyLocalizations.of(context).translate("newOrder");

    return Scaffold(
      appBar: AppBar(
          title: Text(MyLocalizations.of(context).translate("newOrder"))),
      body: _getDrawerItem(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(MyLocalizations.of(context).translate("menu")),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(MyLocalizations.of(context).translate("newOrder")),
              onTap: () {
                _onSelectItem(
                    0, MyLocalizations.of(context).translate("newOrder"));
              },
            ),
            ListTile(
              title: Text(MyLocalizations.of(context).translate("myOrders")),
              onTap: () {
                _onSelectItem(
                    1, MyLocalizations.of(context).translate("myOrders"));
              },
            ),
            // ListTile(
            //   title: Text(MyLocalizations.of(context).translate("profile")),
            //   onTap: () {
            //     _onSelectItem(
            //         2, MyLocalizations.of(context).translate("profile"));
            //   },
            // ),
            ListTile(
              title: Text(MyLocalizations.of(context).translate("exit")),
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

  _logout() async {
    Map<String, Map<String, String>> localizedValues = await initializeI18n();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => new MyApp(localizedValues)),
        (Route<dynamic> route) => false);
  }
}
