// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/modals/cart.dart';
import 'package:flutter_application_1/modals/catelog.dart';
import 'package:flutter_application_1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartBtn extends StatelessWidget {
  final Item catelog;

  const AddToCartBtn({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    // This listens to state change
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    // getting cart from store/state
    final CartModal _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catelog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catelog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Text('Buy'),
    );
  }
}
