import 'package:flutter/material.dart';
import 'package:quick_order/src/models/categories.dart';

import '../../../global/size_configuration.dart';

class CategoryCardExplore extends StatelessWidget {
  const CategoryCardExplore({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.category,
  }) : super(key: key);

  final double width, aspectRetio;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: getProportionateScreenWidth(width),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/details',
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Hero(
                tag: category.id.toString(),
                child: Image.asset(category.images),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                category.name,
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
