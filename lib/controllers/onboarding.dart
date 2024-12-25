import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 2) { // Assuming there are 3 pages
      currentPage.value++;
      pageController.nextPage(duration: Durations.long1, curve: Curves.linear);
    }
    else if(currentPage.value <3){
      Get.toNamed(AppRoutes.loginView);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(duration: Durations.long1, curve: Curves.linear);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}