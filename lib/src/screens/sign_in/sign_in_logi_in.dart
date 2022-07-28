import 'package:flutter/material.dart';
import 'package:quick_order/src/global/size_configuration.dart';

class SignInLogInScreen extends StatefulWidget {
  const SignInLogInScreen({Key? key}) : super(key: key);

  @override
  State<SignInLogInScreen> createState() => _SignInLogInScreenState();
}

class _SignInLogInScreenState extends State<SignInLogInScreen> {
  TextEditingController phone = TextEditingController();
  validate(BuildContext context) {
    if (phone.text.length < 10) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Column(
          children: [
            const ListTile(
              leading: Icon(
                Icons.close,
                color: Colors.red,
              ),
              title: Text('Number should be of 10 digits.'),
            ),
            SizedBox(
              width: double.infinity - 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('close'),
              ),
            ),
          ],
        )),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9900),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: getProportionateScreenHeight(400),
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFFF9900),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(400),
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(15),
            right: getProportionateScreenWidth(15),
            top: getProportionateScreenHeight(150),
            bottom: getProportionateScreenHeight(200),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  const Text('Enter Mobile Number'),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      decoration: const InputDecoration(
                        prefixText: "+91",
                        labelText: "Phone",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          validate(context);
                        },
                        child: const Text('Request OTP'),
                      ),
                    ),
                  )
                ],
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
