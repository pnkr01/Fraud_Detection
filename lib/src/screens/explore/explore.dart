import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_order/src/global/size_configuration.dart';
import 'package:quick_order/src/screens/explore/header_category/explore_header.dart';

import 'header_category/top_list.dart';
import 'second_category/second.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomExploreAppBar(),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenHeight(20),
                right: getProportionateScreenHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Collections',
                    style: GoogleFonts.aBeeZee(
                        fontSize: getProportionateScreenHeight(35))),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '...',
                    style:
                        TextStyle(fontSize: getProportionateScreenHeight(40)),
                  ),
                ),
              ],
            ),
          ),
          const TopListExplore(),
          //const PopularProducts(),
          const NewInProduct(),
        ],
      ),
    );
  }
}
