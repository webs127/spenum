import 'package:flutter/material.dart';

TextStyle _textStyle(String fontFamily, double fontSize, Color color,
        FontWeight fontWeight, FontStyle fontStyle) =>
    TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );

TextStyle regularTextStyle(
        {String fontFamily = "Segoe UI",
        required double fontSize,
        Color color = Colors.black,
        FontStyle fontStyle = FontStyle.normal,
        FontWeight fontWeight = FontWeight.w400}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

TextStyle mediumTextStyle(
        {String fontFamily = "Segoe UI",
        required double fontSize,
        Color color = Colors.black,
        FontStyle fontStyle = FontStyle.normal,
        FontWeight fontWeight = FontWeight.w500}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

TextStyle blackTextStyle({
  String fontFamily = "Segoe UI",
  required double fontSize,
  Color color = Colors.black,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w900,
}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

TextStyle italicTextStyle(
        {String fontFamily = "Segoe UI",
        FontStyle fontStyle = FontStyle.normal,
        required double fontSize,
        Color color = Colors.black,
        FontWeight fontWeight = FontWeight.w900}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);
