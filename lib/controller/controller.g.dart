// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$localeAtom = Atom(name: 'ControllerBase.locale');

  @override
  String get locale {
    _$localeAtom.context.enforceReadPolicy(_$localeAtom);
    _$localeAtom.reportObserved();
    return super.locale;
  }

  @override
  set locale(String value) {
    _$localeAtom.context.conditionallyRunInAction(() {
      super.locale = value;
      _$localeAtom.reportChanged();
    }, _$localeAtom, name: '${_$localeAtom.name}_set');
  }

  final _$productsAtom = Atom(name: 'ControllerBase.products');

  @override
  List<Product> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic addProduct(Product el) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.addProduct(el);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
