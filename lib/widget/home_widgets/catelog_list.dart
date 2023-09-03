import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/add_to_cart_btn.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/widget/themes.dart';
import 'package:flutter_application_1/modals/catelog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';

import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModal.items!.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModal.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catelog: catelog,
              ),
            ),
          ),
          child: CatelogItem(
            catelog: catelog,
          ),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catelog.id.toString()),
            child: CatelogImage(
              image: catelog.image ?? '',
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "${catelog.name}"
                    .text
                    .lg
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                "${catelog.desc}".text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catelog.price}".text.bold.xl.make(),
                    AddToCartBtn(catelog: catelog),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
