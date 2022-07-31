import 'package:flutter/material.dart';
import 'package:quick_order/src/global/constants.dart';

circularProgress() {
  return Container(
    padding: const EdgeInsets.only(top: 12.0),
    alignment: Alignment.center,
    child: const CircularProgressIndicator(
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation(kPrimaryColor),
    ),
  );
}