import 'package:flutter/material.dart';

TextStyle _textStyle(String fontFamily, double fontSize, Color color, FontWeight fontWeight) => TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize,
  color: color,
  fontWeight: fontWeight,
);

TextStyle regularTextStyle({String fontFamily = "Poppins", required double fontSize, Color color =  Colors.black, FontWeight fontWeight = FontWeight.w400}) => _textStyle(fontFamily, fontSize, color, fontWeight);

TextStyle mediumTextStyle({String fontFamily = "Poppins", required double fontSize, Color color =  Colors.black, FontWeight fontWeight = FontWeight.w500}) => _textStyle(fontFamily, fontSize, color, fontWeight);

TextStyle blackTextStyle({String fontFamily = "Poppins", required double fontSize, Color color =  Colors.black, FontWeight fontWeight = FontWeight.w900}) => _textStyle(fontFamily, fontSize, color, fontWeight);