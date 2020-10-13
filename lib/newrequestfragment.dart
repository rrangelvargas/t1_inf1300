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
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        backgroundImage: NetworkImage(product.image),
                      ),
                      Text(product.description),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  void getProducts() async {
    _products.add(new Product(10, "Teste", "20", "Testeeeeeeee", "as"));
    _products.add(new Product(100, "Dip", "20", "Testeeeeeeee", "as"));

    setState(() {});
  }
}
