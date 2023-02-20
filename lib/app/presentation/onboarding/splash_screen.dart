

import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/reusables.dart';
import '../../../core/size_config.dart';
import '../auth/signup_screen.dart';
import '../home/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
          () =>
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(driverLogo),
         SizedBox(
          height: getProportionateScreenHeight(20),
        ),
          createGeneralText(
            inputText: 'Uber & InDriver Clone App',
            fontSize: 24,
            weight: FontWeight.w500,
            colorName: Palette.whiteColor,
            family: FontFamily.interBold,
          ),
        ],
      ),
    );

  }
}