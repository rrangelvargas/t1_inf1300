import 'package:flutter/material.dart';

class NewRequest extends StatefulWidget {
  NewRequest();

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  List<String> _products = List<String>();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: _products.length,
            itemBuilder: (BuildContext context, int index) {
              String product = _products[index];

              return GestureDetector(
                onTap: () {},
                child: ListTile(
                  title: Text(product),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(product),
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        backgroundImage: NetworkImage(product),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  void getProducts() async {
    _products.add('Dipirona');
    setState(() {});
  }
}
