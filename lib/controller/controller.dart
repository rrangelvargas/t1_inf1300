import "package:mobx/mobx.dart";
import 'dart:io';

import 'package:t1_inf1300/cart.dart';
import 'package:t1_inf1300/model/Product.dart';

class Controller {
  var locale = Observable(Platform.localeName.substring(0, 2));

  var product = ObservableList<Product>.of([]);

  _addProduct(Product el) {
    product.add(el);
  }

  Action addProduct;

  Controller() {
    addProduct = Action(_addProduct);
  }
}
