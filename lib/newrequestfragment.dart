import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';
import 'package:t1_inf1300/AddProduct.dart';
import 'package:t1_inf1300/cart.dart';
import 'package:t1_inf1300/StyledRaisedButtonLong.dart';

class NewRequest extends StatefulWidget {
  NewRequest();

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  List<Product> _products = List<Product>();
  String search = '';
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              //controller: editingController,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
          ),
          search.isEmpty
              ? Text('Pesquise para encontrar produtos')
              : Expanded(
                  child: ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = _products[index];
                        return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AddProduct(product: product);
                                  });
                            },
                            child: _buildRow(product));
                      }),
                ),
          search.isEmpty
              ? Text("")
              : StyledRaisedButtonLong(
                  title: 'Adicionar ao carrinho', callback: _navigateToCart)
        ],
      )),
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
            child: Text(product.price),
          ),
        ],
      )),
    );
  }

  void _navigateToCart() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => new Cart()));
  }
}
