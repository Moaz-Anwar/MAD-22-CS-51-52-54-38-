import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_delivery/constants/app_strings.dart';
import 'package:medicine_delivery/constants/app_style.dart';
import 'package:medicine_delivery/constants/color_constant.dart';
import 'package:medicine_delivery/constants/image_constant.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
    ));
  }
}
