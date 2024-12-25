import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/constants/app_strings.dart';
import 'package:medicine_delivery/constants/image_constant.dart';
import '../constants/app_style.dart';
import '../constants/color_constant.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Text(
                  AppString.Favourite,
                  style: AppStyle.profile25w700(),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        ImageConstant.heartImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 30),
                        Container(
                          height: 140,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white.withOpacity(0.9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), // Stronger shadow for contrast
                                spreadRadius: 5,
                                blurRadius: 15,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.Favouritelist,
                                style: AppStyle.Favourite24w500().copyWith(
                                  color: ColorConstant.buttonOrTextColorZinc, // Highlight text color
                                ),
                              ),
                              SizedBox(height: 10), // Increased space between texts
                              Text(
                                AppString.favouritedecp,
                                style: AppStyle.Favouritedecp24w500(),
                              ),
                            ],
                          ),
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
