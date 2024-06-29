import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color hexString(String color) {
    color = color.replaceAll("#", "");
    if(color.length == 6) {
      color = "FF$color";
    }
    return Color(int.parse(color, radix: 16));
  }
}

class ColorManager {
  static Color black = HexColor.hexString("#000000");
  static Color white = HexColor.hexString("#FFFFFF");
  static Color appBarWhite = HexColor.hexString("#F6F6F6");
  static Color white40 = HexColor.hexString("#D6E2DF66");
  static Color grey = HexColor.hexString("#F0F4F3");
  static Color blue = HexColor.hexString("#1616F1");
  static Color green = HexColor.hexString("#00C900");
  static Color green3 = HexColor.hexString("#2DA430");
  static Color green2 = HexColor.hexString("#E1FEC6");
  static Color green1 = HexColor.hexString("#21C004");
  static Color orange = HexColor.hexString("#F09A37");
  static Color red = HexColor.hexString("#FF0000");
  static Color grey1 = HexColor.hexString("#BBBBC3");
  static Color grey3 = HexColor.hexString("#AEAEB2");
  static Color grey2 = HexColor.hexString("#787878");
  static Color grey4 = HexColor.hexString("#858E99");
  static Color grey12 = HexColor.hexString("#767680");
  static Color grey60 = HexColor.hexString("#3C3C43");
  static Color grey100 = HexColor.hexString("#8E8E93");
}