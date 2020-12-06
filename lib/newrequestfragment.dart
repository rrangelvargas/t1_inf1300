import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:t1_inf1300/model/Product.dart';
import 'package:t1_inf1300/AddProduct.dart';
import 'package:t1_inf1300/cart.dart';
import 'package:t1_inf1300/StyledRaisedButtonLong.dart';
import 'controller/controller.dart';
import 'package:provider/provider.dart';

class NewRequest extends StatefulWidget {
  NewRequest();

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  List<Product> _products = List<Product>();
  List<Product> _filteredList = List<Product>();

  String searchLabelText = "";
  String searchHelpLabelText = "";
  String addToCartLabelText = "";
  String locale = "";

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext buildContext) {
    final controller = Provider.of<Controller>(context);
    locale = controller.locale;

    if (locale == "pt") {
      this.searchLabelText = "Buscar";
      this.searchHelpLabelText = "Pesquise para encontrar produtos";
      this.addToCartLabelText = "Adicionar ao carrinho";
    } else if (locale == "es") {
      this.searchLabelText = "No ha realizado ningún pedido";
      this.searchHelpLabelText = "Buscar para encontrar productos";
      this.addToCartLabelText = "Añadir al carrito";
    } else {
      this.searchLabelText = "Search";
      this.searchHelpLabelText = "Search to find products";
      this.addToCartLabelText = "Add to cart";
    }

    var width = MediaQuery.of(context).size.width * 0.8;
    print(controller.products.length);
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
                  filterSearchResults(value);
                });
              },
              //controller: editingController,
              decoration: InputDecoration(
                  hintText: this.searchLabelText,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
          ),
          _filteredList.isEmpty
              ? Container(
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    this.searchHelpLabelText,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ))
              : Expanded(
                  child: ListView.builder(
                      itemCount: _filteredList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = _filteredList[index];
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
          _filteredList.isEmpty & controller.productsIsEmpty
              ? Text("")
              : Observer(
                  builder: (_) => StyledRaisedButtonLong(
                      title: this.addToCartLabelText,
                      callback: _navigateToCart,
                      isEnable: !controller.productsIsEmpty),
                )
        ],
      )),
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
            child: Text('RS ${product.price}'),
          ),
        ],
      )),
    );
  }

  void _navigateToCart() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => new Cart()));
  }

  void filterSearchResults(String query) {
    _filteredList.clear();
    if (query.isNotEmpty) {
      _products.forEach((element) {
        if (element.name.toLowerCase().contains(query.toLowerCase())) {
          _filteredList.add(element);
        }
      });
    }

    setState(() {});
  }
}
