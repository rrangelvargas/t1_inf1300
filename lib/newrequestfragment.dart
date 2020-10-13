import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';

class NewRequest extends StatefulWidget {
  NewRequest();

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  List<Product> _products = List<Product>();

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
              Product product = _products[index];

              return GestureDetector(
                onTap: () {},
                child: ListTile(
                  title: Text(product.name),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(product.description),
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        backgroundImage: NetworkImage(product.image),
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
    _products.add(Product(10, "Teste", "20", "Testeeeeeeee", "as"));

    setState(() {});
  }
}
