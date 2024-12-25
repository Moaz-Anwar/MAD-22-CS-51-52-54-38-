import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../utils/utils.dart';

class SignupScreenController {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(context, email, password,name,phone) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.text.toString(), password: password.text.toString());

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),
        'phone': phone.text.trim(),
        'uid': userCredential.user!.uid,
      });

      Get.toNamed(AppRoutes.loginView);

      Utils().toastMessage(context,
          'User Created! You can login to your Account By Entering your Acount Details');

    }
    catch(e){
      Utils().toastMessage(context, e.toString());
    }
  }
}
