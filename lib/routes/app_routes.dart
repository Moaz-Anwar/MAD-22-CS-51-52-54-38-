import 'package:get/get.dart';
import 'package:medicine_delivery/view/home_screen.dart';
import 'package:medicine_delivery/view/login_view.dart';
import 'package:medicine_delivery/view/onboarding.dart';
import 'package:medicine_delivery/view/signup_screen_view.dart';
import '../view/splash_view.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String splashView = '/splash_view';
  static const String onboardingView = '/onboarding_view';
  static const String loginView = '/login_view';
  static const String signupView = '/signup_screen_view';
  static const String homeView = '/home_screen';
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
    GetPage(
        name: loginView,
        page: () => LoginScreen(),
        transition: Transition.rightToLeft,),
    GetPage(
      name: signupView,
      page: () => SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: homeView,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}