import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture ScreenBackGround(context) {
  return SvgPicture.asset(
    'assets/images/screen_background.svg',
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
    alignment: Alignment.center,
  );
}
