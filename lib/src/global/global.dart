import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/src/services/auth/service/authservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
AuthClass authClass = AuthClass();
void showSnackBar(BuildContext context, String text) {
  final snakbar = SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snakbar);
}
