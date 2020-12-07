import 'package:flutter/material.dart';
import 'package:t1_inf1300/localizations.dart';
import 'package:t1_inf1300/model/Order.dart';
import 'package:t1_inf1300/orderView.dart';
import 'controller/controller.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  MyOrders();

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Order> _orders = List<Order>();

  String noOrdersLabelText = "";
  String waitingLabelText = "";
  String locale = "";
  Controller controller;

  @override
  Widget build(BuildContext buildContext) {
    controller = Provider.of<Controller>(context);
    getProducts();

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _orders.isEmpty
                ? Text(MyLocalizations.of(context).translate("noOrders"))
                : Expanded(
                    child: ListView.builder(
                        itemCount: _orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          Order order = _orders[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new OrderView(
                                          order: _orders[index],
                                        )));
                              },
                              child: _buildRow(order));
                        }),
                  )
          ],
        ),
      ),
    );
  }

  void getProducts() {
    _orders.addAll(controller.orders);
    setState(() {});
  }

  _buildRow(Order order) {
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
              image: NetworkImage(order.products[0].product.image),
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
                  Text(order.products[0].product.name),
                  Text(order.products[0].product.description)
                ]),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('${_getTotalPrice(order)}'),
                Text(MyLocalizations.of(context).translate("waiting"))
              ],
            ),
          ),
        ],
      )),
    );
  }

  String _getTotalPrice(Order order) {
    var price = 0.0;
    for (var item in order.products) {
      price += double.parse(item.product.price) * item.quantity;
    }
    return "RS $price";
  }
}
