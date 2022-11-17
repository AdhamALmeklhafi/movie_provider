import 'package:flutter/material.dart';
import './Constant.dart';
import './SizeConfig.dart';

Widget DefaultButton(String text, Function() press) {
  return Container(
    width: SizeOfConfig.widthScreen - 60,
    height: 45,
    decoration: BoxDecoration(
      color: Color(0xFFF09A36),
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextButton(
      onPressed: press,
      child: Text(
        text,
        style: priBtnText,
      ),
    ),
  );
}
