import 'package:flutter/material.dart';
import 'buildbodyotp.dart';
import 'header_new_user_otp.dart';

class NewUserOTPScreen extends StatefulWidget {
  final String phone;
  const NewUserOTPScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<NewUserOTPScreen> createState() => _NewUserOTPScreenState();
}

class _NewUserOTPScreenState extends State<NewUserOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const HeaderNewOTPSCreeen(),
          BuildBodyNewUser(
            phoneNumber: widget.phone,
          ),
          // BuildBodyOTP(),
        ],
      ),
    );
  }
}
