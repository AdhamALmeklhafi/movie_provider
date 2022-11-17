import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './SizeConfig.dart';

Widget buttonItem(
  String imagepath,
  double size,
  Function() onTap,
  BuildContext context,
) {
  SizeOfConfig().init(context);

  return InkWell(
    onTap: onTap,
    child: Container(
      width: 55,
      height: 45,
      child: SvgPicture.asset(
        imagepath,
        width: getWidthScreen(size),
        height: getHeightScreen(size),
      ),
    ),
  );
}
