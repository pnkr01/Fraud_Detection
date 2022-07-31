import 'package:flutter/material.dart';
import 'package:quick_order/src/global/global.dart';
import 'package:quick_order/src/global/size_configuration.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile> {
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/pic.png"),
                    radius: 70,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              buildAbout(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget builds the About Me Section
  Widget buildAbout() => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Name',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('name')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Your Email',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('email')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Your Phone',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('phone')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              'Your Address',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('address')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text(
              'First SignUp',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('signuptime')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              'Your IP Address',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('ip')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          sharedPreferences!.getString('gender')!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(50),
              )),
              height: getProportionateScreenHeight(50),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () async {
                  showSnackBar(context, 'Logging Out...');
                  await firebaseAuth.signOut().then(
                        (value) => Navigator.pushNamedAndRemoveUntil(
                            context, '/splash', (route) => false),
                      );
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
