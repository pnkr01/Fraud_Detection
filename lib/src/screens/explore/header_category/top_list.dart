import 'package:flutter/material.dart';
import 'package:quick_order/src/models/categories.dart';

import 'explore_header_car.dart';

class TopListExplore extends StatelessWidget {
  const TopListExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        democategory.length,
        (index) {
          return CategoryCardExplore(category: democategory[index]);
        },
      )),
    );
  }
}
