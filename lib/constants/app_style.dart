import 'package:flutter/material.dart';

import 'color_constant.dart';

class AppStyle {
  static TextStyle style28w700({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 28,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle style24w700({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 24,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle style16w400({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle style14w700({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle profile25w700({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 25,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle moawaz25w500() {
    return TextStyle(
      color: ColorConstant.buttonOrTextColorZinc,
      fontSize: 20,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle Edit25w500() {
    return TextStyle(
      color: ColorConstant.whiteColor,
      fontSize: 20,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle Style25w400() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle Style24w400() {
    return TextStyle(
      color: Colors.black,
      fontSize: 16,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle Favourite24w500() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle Favouritedecp24w500() {
    return TextStyle(
      color: Colors.black26,
      fontSize: 18,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle networkErrorTitleStyle() {
    return TextStyle(
      color: ColorConstant.onboardBodyTextLiteGery,
      fontSize: 18,
      // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle networkErrorSubtitleStyle() {
    return TextStyle(
        color: ColorConstant.buttonOrTextColorZinc,
        fontSize: 18,
        // fontFamily: getAppLocal() ? 'SF-Pro-Display' : 'SF-Pro-Arabic',
        fontWeight: FontWeight.w500,
        );
    }

}