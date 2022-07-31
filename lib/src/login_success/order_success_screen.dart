import 'package:flutter/material.dart';
import 'package:quick_order/src/global/global.dart';

import 'components/body.dart';

class OtpSuccessScreen extends StatelessWidget {
  const OtpSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            sharedPreferences!.setInt('cartnum', 0);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Order Success"),
      ),
      body: const Body(),
    );
  }
}
