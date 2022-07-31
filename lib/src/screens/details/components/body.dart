import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/src/global/global.dart';

import '../../../global/components/default_button.dart';
import '../../../global/size_configuration.dart';
import '../../../models/product.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  addToCart() async {
    await FirebaseFirestore.instance
        .collection('phone')
        .doc(sharedPreferences!.getString('phone'))
        .collection('items')
        .doc()
        .set({
      'title': widget.product.title,
      'desc': widget.product.description,
      'image': widget.product.images,
      'price': widget.product.price,
      'item': sharedPreferences!.getInt('item'),
    }).then((value) {
      setState(() {
        isAdded = !isAdded;
      });
      sharedPreferences!
          .setInt('cartnum', sharedPreferences!.getInt('cartnum') ?? 0);
      showSnackBar(context, 'Added sucessfully');
    });
  }

  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: widget.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: isAdded ? 'Go to Cart' : "Add To Cart",
                          press: () => isAdded
                              ? Navigator.pushNamed(context, '/CartScreen')
                              : addToCart(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
