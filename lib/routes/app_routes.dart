import 'package:get/get.dart';
import 'package:medicine_delivery/view/bottom_nav_bar.dart';
import 'package:medicine_delivery/view/cart_view.dart';
import 'package:medicine_delivery/view/favourites_view.dart';
import 'package:medicine_delivery/view/home_screen.dart';
import 'package:medicine_delivery/view/login_view.dart';
import 'package:medicine_delivery/view/onboarding.dart';
import 'package:medicine_delivery/view/profile_view.dart';
import 'package:medicine_delivery/view/search_view.dart';
import 'package:medicine_delivery/view/signup_screen_view.dart';
import '../view/splash_view.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String splashView = '/splash_view';
  static const String onboardingView = '/onboarding_view';
  static const String loginView = '/login_view';
  static const String signupView = '/signup_screen_view';
  static const String homeView = '/home_screen';
  static const String searchView = '/search_view';
  static const String cartView = '/cart_view';
  static const String favouritesView = '/favourites_view';
  static const String profileView = '/profile_view';
  static const String bottomNavigation = '/bottom_nav_bar';
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
    GetPage(
      name: searchView,
      page: () => SearchView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: cartView,
      page: () => CartView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: favouritesView,
      page: () => FavouritesView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: profileView,
      page: () => ProfileView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: bottomNavigation,
      page: () => BottomNavBar(),
      transition: Transition.rightToLeft,
    ),
  ];
}