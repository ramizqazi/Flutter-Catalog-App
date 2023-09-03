// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/modals/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModal {
  // Catelog field
  late CatelogModal _catelog;

  // Collection of ids - store ids of each item
  final List<int> _itemIds = [];

  // Get Catelog -getter
  CatelogModal get catelog => _catelog;

  // Set Catelog - setter
  set catelog(CatelogModal newCatelog) {
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  // Get total price
  num? get totalPrice =>
      items.fold(0, (total, current) => total! + current.price!);

  // Add Item
  void add(Item item) {
    _itemIds.add(item.id!);
  }

  // Remove Item
  void remove(int itemId) {
    _itemIds.remove(itemId);
  }
}

// This is kind of action in redux
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id!);
  }
}

// This is kind of action in redux
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id!);
  }
}
