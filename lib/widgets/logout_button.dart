import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/constants/app_style.dart';
import 'package:medicine_delivery/constants/color_constant.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../controllers/continue_google_controller.dart';
import '../controllers/profile_controller.dart';
import '../utils/utils.dart';

class Button extends StatelessWidget {
  final String title;

  const Button({
    Key? key,
    required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    AuthService _authServices = AuthService();
    return Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConstant.buttonOrTextColorZinc,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: ElevatedButton(
            onPressed: () {
              _authServices.signOut().then((value){
                // controller.clearUserData();
                Get.toNamed(AppRoutes.splashView);
              }).onError((error,stackTrace){
                Utils().toastMessage(context, error.toString());
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.buttonOrTextColorZinc, // White background
              shadowColor: Colors.transparent, // Removes default shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              title,
              style: AppStyle.Edit25w500(),
            ),
            ),
        );
    }
}
