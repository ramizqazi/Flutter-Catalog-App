import 'package:flutter/material.dart';
import 'package:flutter_application_1/modals/catelog.dart';

class GridItemWidget extends StatelessWidget {
  final Item item;

  const GridItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: GridTile(
          header: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              item.name ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          footer: Text(item.price.toString()),
          child: Image.network(
            item.image ?? '',
          ),
        ));
  }
}
