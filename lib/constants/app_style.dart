import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle style28w700({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 28,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w700,
    );
  }
}