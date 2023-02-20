
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants.dart';
import '../../../core/reusable_widgets/build_input_fields.dart';
import '../../../core/reusables.dart';
import '../../../core/size_config.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {

  final TextEditingController _carModel = TextEditingController();
  final TextEditingController _carColor = TextEditingController();
  final TextEditingController _carNumber = TextEditingController();


  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  List<String> carTypeList = ['uber-x', 'uber-go', 'bike',];

  String? selectedCarType;

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
                inputText: 'Write Car Details',
                fontSize: 24,
                weight: FontWeight.w500,
                colorName: Palette.whiteColor,
                family: FontFamily.interBold,
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              BuildInputField(
                keyboardType: TextInputType.name,
                onChanged: (value) {},
                inputController: _carModel,
                inputHintText: 'Name',
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              BuildInputField(
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                inputController: _carNumber,
                inputHintText: 'Phone Number',
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              BuildInputField(
                keyboardType: TextInputType.name,
                onChanged: (value) {},
                inputController: _carColor,
                inputHintText: 'Name',
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              DropdownButton(
                dropdownColor: Colors.white24,
                hint:  createGeneralText(
                  inputText: 'Please choose car type',
                  fontSize: 14,
                  weight: FontWeight.w500,
                  colorName: Palette.greyColor,
                  family: FontFamily.interRegular,
                ),
                  value: selectedCarType,
                  items: carTypeList.map((car) {
                    return DropdownMenuItem(
                        value: car,
                        child: createGeneralText(
                          inputText: car,
                          fontSize: 24,
                          weight: FontWeight.w500,
                          colorName: Palette.greyColor,
                          family: FontFamily.interRegular,
                        ),
                    );
                  } 
                  ).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCarType = value;
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
