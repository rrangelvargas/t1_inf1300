import 'package:flutter/material.dart';
import 'package:t1_inf1300/Product.dart';
import 'package:t1_inf1300/AddProduct.dart';
import 'package:t1_inf1300/cart.dart';

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
              : RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => new Cart()));
                  },
                  child: Text('Adicionar ao carrinho',
                      style: TextStyle(fontSize: 20)),
                ),
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
          Text(product.price),
        ],
      ),
    );
  }
}
