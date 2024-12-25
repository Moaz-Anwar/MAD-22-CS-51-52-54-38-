import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null){
      Timer(Duration(seconds: 3), () => Get.toNamed(AppRoutes.bottomNavigation));
    }else{
      Timer(Duration(seconds: 3), () =>Get.toNamed(AppRoutes.onboardingView));
    }
  }
}
