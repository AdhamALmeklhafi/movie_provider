import 'package:flutter/material.dart';

import './SizeConfig.dart';

const TextStyle primaryTextF = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const TextStyle primaryText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const TextStyle hintTextc = TextStyle(
  fontSize: 11.5,
  color: Colors.grey,
);
const TextStyle hintTextLo = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);
const TextStyle hintText2 = TextStyle(
  fontSize: 11.5,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);

const TextStyle detailText1 = TextStyle(
  fontSize: 17.0,
  color: Colors.grey,
);

const TextStyle priBtnText = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

const TextStyle secBtnText = TextStyle(
  color: Color(0xFFF09A36),
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

ButtonStyle secBtnStyle = OutlinedButton.styleFrom(
  elevation: 6,
  padding: EdgeInsets.symmetric(
    horizontal: getWidthScreen(35),
    vertical: getHeightScreen(5),
  ),
  backgroundColor: const Color(0xffcccccc),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
