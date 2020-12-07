import 'package:flutter/material.dart';
import 'package:t1_inf1300/localizations.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'package:t1_inf1300/order.dart';

class MyOrders extends StatefulWidget {
  MyOrders();

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Product> _products = List<Product>();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _products.isEmpty
                ? Text(MyLocalizations.of(context).translate("noOrders"))
                : Expanded(
                    child: ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = _products[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Order()));
                              },
                              child: _buildRow(product));
                        }),
                  )
          ],
        ),
      ),
    );
  }

  void getProducts() async {
    _products.add(new Product(
        10,
        "Dorflex",
        "20.0",
        "Medicamento destinado a para dores",
        "https://img.onofre.com.br/catalog/product/d/o/dorflex-com-10-comprimidos--7891058017392_hero1.jpg?width=265&height=265&quality=50&type=resize"));
    _products.add(new Product(
        100,
        "Dipirona",
        "10.0",
        "Medicamento destinado a para adultos",
        "https://drogariasp.vteximg.com.br/arquivos/ids/168973-500-500/7896422507066.JPG.jpg?v=635651364067870000"));

    setState(() {});
  }

  _buildRow(Product product) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: Card(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image(
              image: NetworkImage(product.image),
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(product.name),
                  Text(product.description)
                ]),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('RS ${product.price}'),
                Text(MyLocalizations.of(context).translate("waiting"))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
