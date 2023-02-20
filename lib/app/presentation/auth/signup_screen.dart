

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lift_mate/core/size_config.dart';

import '../../../core/constants.dart';
import '../../../core/reusable_widgets/build_input_fields.dart';
import '../../../core/reusables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.blackColor,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10),),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(20),
                ),
                child: Image.asset(driverLogo),
              ),

              SizedBox(height: getProportionateScreenHeight(10),),

              createGeneralText(
                inputText: 'Uber & InDriver Clone App',
                fontSize: 24,
                weight: FontWeight.w500,
                colorName: Palette.whiteColor,
                family: FontFamily.interBold,
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              BuildInputField(
                keyboardType: TextInputType.name,
                onChanged: (value) {},
                inputController: _name,
                inputHintText: 'Name',
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              BuildInputField(
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                inputController: _phoneNumber,
                inputHintText: 'Phone Number',
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              BuildEmailInputField(
                inputHintText: 'Email Address',
                inputController: _email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              BuildPasswordInputField(
                inputHintText: 'Create Password',
                inputController: _password,
                isObscured: _isObscured,
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),

              BuildGeneralButton(
                borderColor: Palette.primaryColor,
                borderRadiusSize: 100,
                buttonColor: Palette.primaryColor,
                buttonText: 'Create Account',
                buttonTextColor: Colors.white,
                buttonTextFamily: FontFamily.interRegular,
                buttonTextSize: 16,
                buttonTextWeight: FontWeight.w700,
                containerHeight: 60,
                containerWidth: double.infinity,
                onPressed: () {
                 // _doCreateUserAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
