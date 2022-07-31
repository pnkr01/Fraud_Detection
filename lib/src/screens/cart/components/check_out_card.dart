import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as https;
import 'package:quick_order/src/global/loading_dialog.dart';
import '../../../global/components/default_button.dart';
import '../../../global/constants.dart';
import '../../../global/errordialog.dart';
import '../../../global/global.dart';
import '../../../global/size_configuration.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    securityCheck() async {
      showDialog(
          context: context,
          builder: (context) => const LoadingDialog(
                message: '',
              ));
      final Map<String, dynamic> body = {
        "api_key": "cccad4cc-c158-4aa7-973d-42e4bd1ee306",
        "user_id": Random().nextInt(10),
        "purchase_value": 750,
        "sex": sharedPreferences!
            .getString('gender')!
            .substring(0, 1)
            .toUpperCase(),
        "age": sharedPreferences!.getInt('age') ?? 20,
        "signup_time": sharedPreferences!.getString('signuptime') ??
            "2022-07-31T07:54:31.843Z",
        "purchase_time": sharedPreferences!.getString('signuptime') ??
            "2022-07-31T11:07:09.768Z",
        "source": "direct",
        "device_id": "swLJ42lu6vgn0uZGmmTb",
        "ip_address": "49.37.44.101"
      };
      //send post request.
      //get request
      // var response = await https.post(
      //   Uri.parse('https://fraud-detect.deta.dev/api/predict/'),
      //   body: body,
      // );
      var response = await https.post(
        Uri.parse('https://fraud-detect.deta.dev/api/predict'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var result = await jsonDecode(response.body);
        if (result != null) {
          Navigator.pop(context);
          if (result["score"] >= 1 && result["score"] <= 3) {
            DateTime purchaseTime = DateTime.now();
            await FirebaseFirestore.instance
                .collection('phone')
                .doc(sharedPreferences!.getString('phone'))
                .update({
              'purchase-time': purchaseTime.toIso8601String(),
            });
            sharedPreferences!
                .setString('purchase-time', purchaseTime.toIso8601String());

            showSnackBar(context, result["message"]);
            // ignore: dead_code
            Navigator.pushNamed(context, '/orderPlaced');
            // ignore: dead_code
          } else if (result["score"] >= 4 && result["score"] <= 7) {
            showDialog(
              context: context,
              builder: (context) => const ErrorDialog(
                  message:
                      'There is need for manual investigation, your account is suspended for 24 hours '),
            );
          } else {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => const ErrorDialog(
                message:
                    'We have flagged and block this user sucessfully. Mail us if you think this is mistake at abc@gmail.com',
              ),
            );
            await FirebaseFirestore.instance
                .collection('flagged-user')
                .doc(sharedPreferences!.getString('phone'))
                .set({
              'flagged': true,
              'reason': 'suspecious activity',
            }).then((value) {
              Navigator.pop(context);
              firebaseAuth.signOut().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/splash', (route) => false);
              });
            });
          }
        } else {
          Navigator.pop(context);
          const ErrorDialog(
            message: 'Some Error occured',
          );
        }
      } else {
        Navigator.pop(context);
        const ErrorDialog(
          message: 'Error Status code',
        );
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
