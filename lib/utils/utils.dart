import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class Utils {

  void toastMessage(BuildContext context,String message) {

    FlutterToastr.show(
        message,
        context, duration: FlutterToastr.lengthLong,
        position: FlutterToastr.bottom);
  }
}