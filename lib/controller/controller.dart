import "package:mobx/mobx.dart";
import 'package:t1_inf1300/model/Cart.dart';
import 'package:t1_inf1300/model/Order.dart';
import 'dart:io';
import 'package:t1_inf1300/model/Product.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String locale = Platform.localeName.substring(0, 2);

  @observable
  List<Product> products = List.of([]);

  @observable
  List<Cart> cart = List.of([]);

  @observable
  List<Order> orders = List.of([]);

  @action
  addToOrder() {
    Order order = Order();
    order.products.addAll(cart);
    orders.add(order);
    cart.clear();
  }

  @action
  addToCart(int quantity, Product product) {
    Cart c = Cart();
    c.quantity = quantity;
    c.product = product;
    cart.add(c);
  }

  @computed
  bool get cartIsEmpty => cart.isEmpty;

  @computed
  bool get productsIsEmpty => products.isEmpty;

  @action
  addProduct(Product el) {
    products.add(el);
    print(productsIsEmpty);
  }
}
