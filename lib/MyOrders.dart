import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';
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
                ? Text('Você não fez nenhum pedido')
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
    _products.add(new Product(10, "Teste", "20", "Testeeeeeeee",
        "https://drogariasp.vteximg.com.br/arquivos/ids/168973-500-500/7896422507066.JPG.jpg?v=635651364067870000"));
    _products.add(new Product(100, "Dip", "20", "Testeeeeeeee",
        "https://drogariasp.vteximg.com.br/arquivos/ids/168973-500-500/7896422507066.JPG.jpg?v=635651364067870000"));

    setState(() {});
  }

  _buildRow(Product product) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            image: NetworkImage(product.image),
            width: 50,
            height: 50,
          ),
          Column(children: <Widget>[
            Text(product.name),
            Text(product.description)
          ]),
          Column(
            children: <Widget>[Text(product.price), Text("Aguardando")],
          )
        ],
      ),
    );
  }
}
