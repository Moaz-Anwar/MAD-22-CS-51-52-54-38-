import 'package:get/get.dart';
import 'package:medicine_delivery/view/onboarding.dart';
import '../view/splash_view.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String splashView = '/splash_view';
  static const String onboardingView = '/onboarding_view';
  static List<GetPage> pages =[
   GetPage(
    name: splashScreen,
    page: () => SplashView(),
    transition: Transition.rightToLeft,
    ),
    GetPage(
      name: onboardingView,
      page: () => Onboarding(),
      transition: Transition.rightToLeft,
    ),
  ];
}