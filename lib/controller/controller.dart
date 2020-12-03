import "package:mobx/mobx.dart";
import 'dart:io';

class Controller {
  var locale = Observable(Platform.localeName.substring(0, 2));

  Controller() {}
}
