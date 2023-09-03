import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/cart_list.dart';
import 'package:flutter_application_1/widget/cart_total.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: Text('Cart'),
        iconTheme: context.theme.appBarTheme.iconTheme,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(Icons.chevron_left),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: CartList().p32(),
          ),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}
