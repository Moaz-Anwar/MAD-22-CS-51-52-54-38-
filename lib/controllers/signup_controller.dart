import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../utils/utils.dart';

class SignupScreenController {
  final _auth = FirebaseAuth.instance;


  void signUp(context,email,password){
    _auth.createUserWithEmailAndPassword(
        email: email.text.toString(),
        password: password.text.toString()).then((value) {
      Utils().toastMessage(context, 'User Created! You can login to your Account By Entering your Acount Details');
      Get.toNamed(AppRoutes.loginView);
    },).onError((error, stackTrace) {
      Utils().toastMessage(context,error.toString());
    },);
  }
}
