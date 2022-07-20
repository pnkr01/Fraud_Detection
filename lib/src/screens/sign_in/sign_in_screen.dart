import 'package:flutter/material.dart';
import 'package:quick_order/src/global/size_configuration.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(100),
            ),
            const Center(child: Text('Sign In'))
          ],
        ),
      ),
      body: const Body(),
    );
  }
}
