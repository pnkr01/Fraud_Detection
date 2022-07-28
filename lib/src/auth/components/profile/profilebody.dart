import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../global/errordialog.dart';
import '../../../global/global.dart';
import '../../../global/loading_dialog.dart';
import '../../../screens/home/home_screen.dart';

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
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.2,
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
                TextField(
                  controller: fullName,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email *",
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    validateForm(context);
                    //TODOS: Send to account sucessfully created screen.
                    //TODOS : on continue button clicked.
                  },
                  child: SizedBox(
                    height: size.height * 0.06,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateForm(BuildContext context) async {
    if (fullName.text.isNotEmpty && email.text.isNotEmpty) {
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
    //TODOS: SETTING WILL BE HAPPEN AFTER VECHICLE ADDITION.
    //TODOS: IF NEW USER LEFT VECH ADD AND CLOSE APP THEN AGAIN HE/SHE HAVE TO FILL THIS.
    await FirebaseFirestore.instance
        .collection("phone")
        .doc(widget.phoneNumber)
        .set(
          ({
            "userEmail": email.text.trim(),
            "phoneNumber": widget.phoneNumber.trim(),
            "fullName": fullName.text.trim(),
          }),
        );

    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.setBool("walletOpen", false);
    await sharedPreferences.setString("email", email.text.trim());
    await SharedPreferences.getInstance();
    await sharedPreferences.setString("fullName", fullName.text.trim());
    await sharedPreferences.setString(
        "phoneNumber", sharedPreferences.getString("phone")!);
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
