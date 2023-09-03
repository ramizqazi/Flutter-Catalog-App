// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/modals/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/modals/catelog.dart';
import 'package:flutter_application_1/widget/home_widgets/catelog_header.dart';
import 'package:flutter_application_1/widget/home_widgets/catelog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  final url = "https://api.jsonbin.io/v3/b/6409fd7aace6f33a22ebf8cc";

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    // this rootBundle will get json and convert it to string

    // local data getting
    // final jsonData = await rootBundle.loadString('assets/files/catelog.json');

    // network data getting
    final response = await http.get(Uri.parse(url));
    final jsonData = response.body;
    // this will convert it back to json
    final decodedJsonData = jsonDecode(jsonData);
    final productsData = decodedJsonData['record']['products'];

    CatelogModal.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          splashColor: Colors.blueGrey,
          backgroundColor:
              context.theme.floatingActionButtonTheme.backgroundColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red600,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.mOnly(right: 32, left: 32, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if (CatelogModal.items != null)
                Expanded(child: CatelogList().pOnly(top: 16))
              else
                Expanded(
                    child: Center(child: CircularProgressIndicator().py16())),
            ],
          ),
        ),
      ),
    );
  }
}
