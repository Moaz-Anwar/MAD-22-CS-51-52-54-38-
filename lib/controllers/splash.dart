import 'dart:async';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class Splash extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Set up a timer to navigate after 3 seconds
    Timer(Duration(seconds: 3), () => Get.offNamed(AppRoutes.onboardingView));
  }
}
