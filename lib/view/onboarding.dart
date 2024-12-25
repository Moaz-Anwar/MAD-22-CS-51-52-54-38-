import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/constants/app_strings.dart';
import 'package:medicine_delivery/constants/app_style.dart';
import 'package:medicine_delivery/constants/color_constant.dart';
import 'package:medicine_delivery/constants/image_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding.dart';
import '../widgets/onboarding_widget.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 70,bottom: 40,left: 25,right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentPage.value = index;
                    },
                    children: [
                      Onboardingwidget(
                          image1: ImageConstant.onboarding1Men,
                          boldText: AppString.onboard1BoldText,
                          bodyText: AppString.onboard1BodyText),
                      Onboardingwidget(
                          image1: ImageConstant.onboarding2Women,
                          boldText: AppString.onboard2BoldText,
                          bodyText: AppString.onboard2BodyText),
                      Onboardingwidget(
                          image1: ImageConstant.onboarding3Men,
                          boldText: AppString.onboard3BoldText,
                          bodyText: AppString.onboard3BodyText),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => controller.currentPage.value > 0
                        ? TextButton(
                      onPressed: controller.previousPage,
                      child: Text(
                        AppString.previous,
                        style: AppStyle.style14w700(color:  ColorConstant.onboardTextButtonDarkGery),
                      ),
                    )
                        : SizedBox()), // Show button only if not on the first page

                    SmoothPageIndicator(
                      controller: controller.pageController,
                      count: 3, // Assuming 3 pages
                      effect: SlideEffect(
                        dotColor: ColorConstant.onboardTextButtonDarkGery,
                        dotHeight: 7,
                        dotWidth: 7,
                        activeDotColor: ColorConstant.buttonOrTextColorZinc,
                      ),
                    ),

                    Obx(() => controller.currentPage.value < 3 // Show the next button only on the first two pages
                        ? TextButton(
                      onPressed: controller.nextPage,
                      child: Text(
                        AppString.next,
                        style: AppStyle.style14w700(color: ColorConstant.buttonOrTextColorZinc),

                      ),
                    )
                        : SizedBox()
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}