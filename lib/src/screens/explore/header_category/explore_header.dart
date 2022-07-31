import 'package:flutter/material.dart';
import 'package:quick_order/src/global/size_configuration.dart';

import '../../../global/global.dart';
import '../../home/components/icon_btn_with_counter.dart';

class CustomExploreAppBar extends StatelessWidget {
  const CustomExploreAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          )),
      centerTitle: true,
      title: const Text(
        'Collection',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(4)),
          child: IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: sharedPreferences!.getInt('cartnum') ?? 0,
            press: () {
              Navigator.pushNamed(context, '/CartScreen');
            },
          ),
        ),
      ],
    );
  }
}
