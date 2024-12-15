import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../utils/utils.dart';

class LoginController {
  final _auth = FirebaseAuth.instance;

  void login(context,email,password) {

    if (kDebugMode) {
      print("Email: $email");
    }
    if (kDebugMode) {
      print("Password: $password");
    }
    _auth
        .signInWithEmailAndPassword(
            email: email.text.toString().trim(),
            password: password.text.toString().trim(),)
        .then((value) {
      Utils().toastMessage(context, value.user!.email.toString());
      Get.toNamed(AppRoutes.bottomNavigation);
    }).onError((error, StackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(context, error.toString());
    });
  }
}
