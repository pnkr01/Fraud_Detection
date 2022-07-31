import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/src/global/size_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../global/errordialog.dart';
import '../../../../global/global.dart';
import '../../../../global/loading_dialog.dart';
import '../../../../screens/home/home_screen.dart';

class BuildProfileBody extends StatefulWidget {
  final String phoneNumber;
  const BuildProfileBody({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<BuildProfileBody> createState() => _BuildProfileBodyState();
}

class _BuildProfileBodyState extends State<BuildProfileBody> {
  List<String> item = [
    'Female',
    'Male',
  ];
  String selectedItem = 'Female';
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.3,
      bottom: 0,
      left: size.width * 0.0002,
      right: size.width * 0.0002,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // color: Colors.red,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: fullName,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Full Name *",
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Email *",
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                TextField(
                  maxLines: 5,
                  controller: address,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Address *",
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 0.80,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      items: item
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (item) => setState(() {
                        selectedItem = item as String;
                        if (kDebugMode) {
                          print(selectedItem);
                        }
                      }),
                      value: selectedItem,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                TextField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Age *",
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      validateForm(context);
                      //TODOS: Send to account sucessfully created screen.
                      //TODOS : on continue button clicked.
                    },
                    child: const Text('Continue'),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateForm(BuildContext context) async {
    if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        address.text.isNotEmpty &&
        selectedItem.isNotEmpty &&
        age.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const LoadingDialog(
              message: "",
            );
          });
      await saveDataToFirebase(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              message: "Please fill all details",
            );
          });
    }
  }

  saveDataToFirebase(BuildContext context) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    //TODOS: SETTING WILL BE HAPPEN AFTER VECHICLE ADDITION.
    //TODOS: IF NEW USER LEFT VECH ADD AND CLOSE APP THEN AGAIN HE/SHE HAVE TO FILL THIS.
    await FirebaseFirestore.instance
        .collection("phone")
        .doc(widget.phoneNumber)
        .set(
          ({
            "email": email.text.trim(),
            "phone": widget.phoneNumber.trim(),
            "name": fullName.text.trim(),
            "address": address.text.trim(),
            'age': age.text.trim(),
            'gender': selectedItem.trim(),
            'source': sharedPreferences.getString('source'),
            'browser': sharedPreferences.getString('browser'),
            'signuptime': sharedPreferences.getString('signuptime'),
            'ip': sharedPreferences.getString('ip'),
          }),
        );

    await sharedPreferences.setString("email", email.text.trim());
    await sharedPreferences.setString("ip", sharedPreferences.getString('ip')!);
    await sharedPreferences.setString(
        "source", sharedPreferences.getString('source') ?? null.toString());
    await sharedPreferences.setString(
        "browser", sharedPreferences.getString('browser') ?? null.toString());
    await sharedPreferences.setString("signuptime",
        sharedPreferences.getString('signuptime') ?? null.toString());
    await sharedPreferences.setString("age", age.text.trim());
    await sharedPreferences.setString("gender", selectedItem.trim());
    await sharedPreferences.setString("address", address.text.trim());
    await SharedPreferences.getInstance();
    await sharedPreferences.setString("name", fullName.text.trim());
    await sharedPreferences.setString(
        "phone", sharedPreferences.getString("phone") ?? '2222222222');
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        //TODOS: WHERE TO SEND USER AFTER COMPLETE SIGN IN..
        builder: (context) => const HomeScreen(),
      ),
      (route) => false,
    );
    showSnackBar(context, "LoggedIn Sucessfully");
  }
}
