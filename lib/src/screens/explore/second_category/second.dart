import 'package:flutter/material.dart';
import 'package:quick_order/src/global/size_configuration.dart';
import 'package:quick_order/src/models/product.dart';
import '../../home/components/section_title.dart';
import 'secondary_card.dart';

class NewInProduct extends StatelessWidget {
  const NewInProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "New In Product", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoNewInProduct.length,
                (index) {
                  if (demoNewInProduct[index].isNew) {
                    return NewInnewproductCard(
                      newproduct: demoNewInProduct[index],
                    );
                  }
                  return const SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              // SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
