import 'package:flutter/material.dart';

class AppConstant {
  BoxDecoration curebox() => BoxDecoration(border: Border.all());

  TextStyle h1Style({
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      TextStyle(
          fontSize: size ?? 36,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color);
  TextStyle h2Style({
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      TextStyle(
          fontSize: size ?? 22,
          fontWeight: fontWeight ?? FontWeight.w700,
          color: color);
  TextStyle h3Style({
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      TextStyle(
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color);
}
