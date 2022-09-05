import 'package:flutter/material.dart';

const psPrimaryColor = Color(0xFFf36f37);
const psSecondaryColor = Color(0xFF2c2664);
const psContentColorLightTheme = Color(0xFF2a363f);
const psContentColorDarkTheme = Color(0xFFF5FCF9);
const psWarninngColor = Color(0xFFF3BB1C);
const psErrorColor = Color(0xFFF03738);
const psBackgroundColor = Color.fromARGB(255, 255, 250, 248);
const psSuccessColor = Color.fromARGB(255, 3, 176, 41);
const psDefaultPadding = 20.0;

List<BoxShadow> psBoxShadow(
    {Color color = const Color(0x779E9E9E),
    double distance = 0,
    double flou = 5,
    Offset decalage = const Offset(0, 3)}) {
  return [
    BoxShadow(
      color: color,
      spreadRadius: distance,
      blurRadius: flou,
      offset: decalage, // changes position of shadow
    ),
  ];
}
