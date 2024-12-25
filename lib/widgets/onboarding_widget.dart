import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_delivery/constants/app_strings.dart';
import 'package:medicine_delivery/constants/app_style.dart';
class Onboardingwidget extends StatefulWidget {
  final String image1;
  final String? image2;
  final String? image3;
  final String boldText, bodyText;
  const Onboardingwidget({super.key,
    required this.image1,
    required this.boldText,
    required this.bodyText,
    this.image2,
    this.image3
  });

  @override
  State<Onboardingwidget> createState() => _OnboardingwidgetState();
}

class _OnboardingwidgetState extends State<Onboardingwidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 243, height: 342,
              //decoration: BoxDecoration(border: Border.all()),
              child: SvgPicture.asset(widget.image1,)),

          Container(child: Column(
            children: [
              Container(
                //  decoration: BoxDecoration(border: Border.all()),
                  child: Text(widget.boldText, style: AppStyle.style24w700(),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 20,),
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                  child: Text(widget.bodyText, style: AppStyle.style16w400(),
                    textAlign: TextAlign.center,
                  )),
            ],
          )),

        ],
      ),
    );
  }
}