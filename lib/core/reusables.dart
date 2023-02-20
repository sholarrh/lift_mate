import 'package:flutter/material.dart';
import 'package:lift_mate/core/size_config.dart';

import 'constants.dart';

Text createGeneralText({
  required String inputText,
  required double fontSize,
  required String family,
  required FontWeight weight,
  required Color colorName,
  bool? softWrap,
  TextOverflow? overflow,
  double letterSpacing = 0.0,
  TextAlign? textAlign,
}) {
  return Text(
    inputText,
    textAlign: textAlign,
    softWrap: softWrap,
    style: TextStyle(
        letterSpacing: getProportionateScreenWidth(letterSpacing),
        fontSize: getProportionateScreenWidth(fontSize),
        fontFamily: family,
        fontWeight: weight,
        overflow: overflow,
        color: colorName),
  );
}

class BuildButton extends StatelessWidget {
  BuildButton({
    required this.onPressed,
    required this.containerHeight,
    required this.containerWidth,
    required this.borderRadiusSize,
    required this.buttonColor,
    required this.borderColor,
    required this.buttonChild,
  });

  void Function()? onPressed;
  double containerHeight;
  double containerWidth;
  double borderRadiusSize;
  Color buttonColor;
  Widget buttonChild;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(containerHeight),
      width: getProportionateScreenWidth(containerWidth),
      child: ElevatedButton(
        onPressed: onPressed,
        child: buttonChild,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                side: BorderSide(color: borderColor))),
      ),
    );
  }
}

class BuildGeneralButton extends StatelessWidget {
  BuildGeneralButton({
    required this.onPressed,
    required this.buttonText,
    required this.containerHeight,
    required this.containerWidth,
    required this.borderRadiusSize,
    required this.buttonTextSize,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.borderColor,
    required this.buttonTextWeight,
    required this.buttonTextFamily,
  });

  void Function()? onPressed;
  String buttonText;
  double containerHeight;
  double containerWidth;
  double borderRadiusSize;
  double buttonTextSize;
  Color buttonTextColor;
  Color buttonColor;
  Color borderColor;
  FontWeight buttonTextWeight;
  String buttonTextFamily;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(containerHeight),
      width: getProportionateScreenWidth(containerWidth),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: getProportionateScreenWidth(buttonTextSize),
              fontWeight: buttonTextWeight,
              fontFamily: buttonTextFamily),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                side: BorderSide(color: borderColor))),
      ),
    );
  }
}

// class BuildInputField extends StatefulWidget {
//   BuildInputField({
//     required this.inputController,
//     required this.inputHintText,
//     required this.inputTitleText,
//     required this.keyboardType,
//     this.maxLength,
//     required this.isObscured,
//   });
//
//   TextEditingController inputController;
//   String inputHintText;
//   String inputTitleText;
//   TextInputType keyboardType;
//   int? maxLength;
//   bool isObscured;
//
//   @override
//   State<BuildInputField> createState() => _BuildInputFieldState();
// }
//
// class _BuildInputFieldState extends State<BuildInputField> {
//   bool isPressed = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         isPressed
//             ? SizedBox()
//             : Padding(
//                 padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
//                 child: createGeneralText(
//                     inputText: widget.inputTitleText,
//                     fontSize: 20,
//                     family: FontFamily.interRegular,
//                     weight: FontWeight.w500,
//                     colorName: Palette.blackColor),
//               ),
//         SizedBox(
//           height: getProportionateScreenHeight(9),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(48),
//           child: TextFormField(
//             cursorColor: Palette.greyColor,
//             controller: widget.inputController,
//             keyboardType: widget.keyboardType,
//             enabled: true,
//             maxLength: widget.maxLength,
//             autovalidateMode: AutovalidateMode.disabled,
//             validator: (value) =>
//                 value!.isEmpty ? 'Enter ${widget.inputTitleText}' : null,
//             onChanged: (value) {
//               setState(() {
//                 if (value.isEmpty) {
//                   isPressed = false;
//                 } else {
//                   isPressed = true;
//                 }
//               });
//             },
//             obscureText: widget.isObscured ? true : false,
//             decoration: InputDecoration(
//                 counterText: '',
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: getProportionateScreenWidth(14),
//                 ),
//                 labelText: widget.inputTitleText,
//                 labelStyle: TextStyle(
//                     fontSize: getProportionateScreenWidth(16),
//                     fontFamily: FontFamily.interMedium,
//                     fontWeight: FontWeight.w500,
//                     color: Palette.blackColor),
//                 hintText: widget.inputHintText,
//                 hintStyle: TextStyle(
//                     fontSize: getProportionateScreenWidth(16),
//                     fontFamily: FontFamily.interRegular,
//                     fontWeight: FontWeight.w400,
//                     color: Palette.greyColor),
//                 filled: true,
//                 fillColor: Palette.whiteColor,
//                 focusColor: Palette.primaryColor,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Palette.primaryColor),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Palette.greyColor),
//                 ),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 )),
//           ),
//         )
//       ],
//     );
//   }
// }

warningSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: FontFamily.interRegular,
          fontSize: 16,
          color: Palette.whiteColor,
        ),
      ),
      backgroundColor: Colors.amber,
      duration: Duration(seconds: 5),
    ),
  );
}

successSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: FontFamily.interRegular,
          fontSize: 16,
          color: Palette.whiteColor,
        ),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5),
    ),
  );
}

failureSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: FontFamily.interRegular,
          fontSize: 16,
          color: Palette.whiteColor,
        ),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ),
  );
}
