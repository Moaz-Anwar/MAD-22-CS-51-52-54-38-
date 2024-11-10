import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../utils/utils.dart';

class SignupScreenController {
  final _auth = FirebaseAuth.instance;


  void signUp(context,email,password){
    _auth.createUserWithEmailAndPassword(
        email: email.text.toString(),
        password: password.text.toString()).then((value) {
    },).onError((error, stackTrace) {
      Utils().toastMessage(context,error.toString());
    },);

  }
}
