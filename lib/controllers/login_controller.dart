import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../utils/utils.dart';

class LoginController {
  final _auth = FirebaseAuth.instance;

  void login(context,email,password) {
    _auth
        .signInWithEmailAndPassword(
            email: email.text.toString(),
            password: password.text.toString(),)
        .then((value) {
      Utils().toastMessage(context, value.user!.email.toString());
      Get.toNamed(AppRoutes.homeView);
    }).onError((error, StackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(context, error.toString());
    });
  }
}
