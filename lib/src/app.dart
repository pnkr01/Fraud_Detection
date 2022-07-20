import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quick_order/src/app_theme.dart';
import 'package:quick_order/src/global/global.dart';
import 'package:quick_order/src/screens/cart/cart_screen.dart';
import 'package:quick_order/src/screens/complete_profile/complete_profile_screen.dart';
import 'package:quick_order/src/screens/details/details_screen.dart';
import 'package:quick_order/src/screens/forgot_password/forgot_password_screen.dart';
import 'package:quick_order/src/screens/home/home_screen.dart';
import 'package:quick_order/src/screens/login_success/login_success_screen.dart';
import 'package:quick_order/src/screens/otp/otp_screen.dart';
import 'package:quick_order/src/screens/profile/profile_screen.dart';
import 'package:quick_order/src/screens/sign_in/sign_in_screen.dart';
import 'package:quick_order/src/screens/sign_up/sign_up_screen.dart';
import 'package:quick_order/src/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Order',
      theme: theme(),
      home: const HandleOnboarding(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/signIn': (context) => const SignInScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/loginSucessful': (context) => LoginSuccessScreen(),
        '/signUpScreen': (context) => SignUpScreen(),
        '/completeProfileScreen': (context) => CompleteProfileScreen(),
        '/otpScreen': (context) => const OtpScreen(),
        '/home': (context) => const HomeScreen(),
        '/detailsScreen': (context) => DetailsScreen(),
        '/cartScreen': (context) => const CartScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
      },
    );
  }
}

class HandleOnboarding extends StatefulWidget {
  const HandleOnboarding({Key? key}) : super(key: key);

  @override
  State<HandleOnboarding> createState() => _HandleOnboardingState();
}

class _HandleOnboardingState extends State<HandleOnboarding> {
  @override
  void initState() {
    setTimer();
    super.initState();
  }

  setTimer() {
    Timer(const Duration(seconds: 2), () {
      if (firebaseAuth.currentUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/splash');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(
                        Icons.local_grocery_store,
                        color: Colors.orange,
                        size: 50.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    const Text(
                      "Chutki Shop",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset('assets/images/a.png', height: 20),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const CircularProgressIndicator(
                      color: Color(0xFFFF9900),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
