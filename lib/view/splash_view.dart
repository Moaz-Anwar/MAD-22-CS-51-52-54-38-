import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_delivery/constants/app_strings.dart';
import 'package:medicine_delivery/constants/app_style.dart';
import 'package:medicine_delivery/constants/color_constant.dart';
import 'package:medicine_delivery/constants/image_constant.dart';
import 'package:medicine_delivery/controllers/splash.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController splashController = SplashController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.onInit();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(child: Scaffold(
        body: Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageConstant.splashLogo),
              Text(AppString.medMarket,
                style: AppStyle.style28w700(
                    color: ColorConstant.buttonOrTextColorZinc),)
            ],
          ),),
      )),
    );
  }
}
