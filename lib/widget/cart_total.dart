import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/modals/cart.dart';
import 'package:flutter_application_1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModal cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Amount :', style: TextStyle(fontSize: 19)),
              VxConsumer(
                mutations: const {RemoveMutation},
                builder: (context, store, _) {
                  return Text('\$${cart.totalPrice}',
                      style: TextStyle(fontSize: 28));
                },
              ),
            ],
          ),
          WidthBox(30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("This feature is not support yet.")));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
            child: Text('Checkout'),
          ).wh(100, 44),
        ],
      ).py24(),
    );
  }
}
