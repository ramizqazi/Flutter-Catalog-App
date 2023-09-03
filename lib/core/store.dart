import 'package:flutter_application_1/modals/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/modals/catelog.dart';

class MyStore extends VxStore {
  late CatelogModal catelog;
  late CartModal cart;

  MyStore() {
    catelog = CatelogModal();
    cart = CartModal();
    cart.catelog = catelog;
  }
}
