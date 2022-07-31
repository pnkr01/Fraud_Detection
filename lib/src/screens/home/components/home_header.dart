import 'package:flutter/material.dart';
import 'package:quick_order/src/global/global.dart';
import '../../../global/size_configuration.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: sharedPreferences!.getInt('cartnum')??0,
            press: () {
              Navigator.pushNamed(context, '/CartScreen');
            },
          ),
        ],
      ),
    );
  }
}
