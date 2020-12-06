import "package:mobx/mobx.dart";
import 'dart:io';

import 'package:t1_inf1300/model/Product.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String locale = Platform.localeName.substring(0, 2);

  @observable
  List<Product> products = List.of([]);

  @action
  addProduct(Product el) {
    products.add(el);
    print(products.length);
  }
}
