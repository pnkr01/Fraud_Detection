import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_order/src/global/global.dart';

import '../../../global/components/default_button.dart';
import '../../../global/constants.dart';
import '../../../global/size_configuration.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    securityCheck() async {
      //send post request.
      //get request
      if (true) {
        DateTime purchaseTime = DateTime.now();
        await FirebaseFirestore.instance
            .collection('phone')
            .doc(sharedPreferences!.getString('phone'))
            .update({
          'purchase-time': purchaseTime.toIso8601String().substring(11, 19),
        });
        sharedPreferences!.setString(
            'purchase-time', purchaseTime.toIso8601String().substring(11, 19));
        // ignore: dead_code
        Navigator.pushNamed(context, '/orderPlaced');
        // ignore: dead_code
      } else {
        showSnackBar(context,
            'Your account is flagged, We find some suspicious transcation, reach us out at abc@gmail.com');
        await FirebaseFirestore.instance
            .collection('flagged-user')
            .doc(sharedPreferences!.getString('phone'))
            .set({
          'flagged': true,
          'reason': 'suspecious activity',
        }).then((value) {
          firebaseAuth.signOut().then((value) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/splash', (route) => false);
          });
        });
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "Rs. 720.49",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      securityCheck();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
