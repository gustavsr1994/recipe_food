import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

TextStyle textStyleSmall({Color? colorFont, bool? boldStatus}) {
  return TextStyle(
      fontSize: 10,
      color: colorFont,
      fontWeight: boldStatus == true ? FontWeight.bold : FontWeight.normal);
}

TextStyle textStyleMedium({Color? colorFont, bool? boldStatus}) {
  return TextStyle(
      fontSize: 15,
      color: colorFont,
      fontWeight: boldStatus == true ? FontWeight.bold : FontWeight.normal);
}

TextStyle textStyleLarge({Color? colorFont, bool? boldStatus}) {
  return TextStyle(
      fontSize: 18,
      color: colorFont,
      fontWeight: boldStatus == true ? FontWeight.bold : FontWeight.normal);
}

TextStyle textStyleXtraLarge({Color? colorFont, bool? boldStatus}) {
  return TextStyle(
      fontSize: 22,
      color: colorFont,
      fontWeight: boldStatus == true ? FontWeight.bold : FontWeight.normal);
}