import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_order/src/models/product.dart';
import 'package:quick_order/src/screens/details/details_screen.dart';

import '../../../global/constants.dart';
import '../../../global/size_configuration.dart';

class NewInnewproductCard extends StatelessWidget {
  const NewInnewproductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.newproduct,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product newproduct;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          // width: getProportionateScreenWidth(width),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/details',
              arguments: ProductDetailsArguments(product: newproduct),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: getProportionateScreenHeight(300),
                  width: getProportionateScreenWidth(280),
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: newproduct.id.toString()*20,
                    child: Image.asset(newproduct.images[0]),
                  ),
                ),
                // AspectRatio(
                //   aspectRatio: 1.02,
                //   child:
                //   Container(
                //     height: 100,
                //     width: getProportionateScreenHeight(50),
                //     padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                //     decoration: BoxDecoration(
                //       color: kSecondaryColor.withOpacity(0.1),
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Hero(
                //       tag: newproduct.id.toString(),
                //       child: Image.asset(newproduct.images[0]),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),
                Text(
                  newproduct.title,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs.${newproduct.price}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: newproduct.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: newproduct.isFavourite
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
