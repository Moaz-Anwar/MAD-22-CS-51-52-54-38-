import 'package:flutter/material.dart';
import 'package:medicine_delivery/constants/color_constant.dart';



class RoundButton extends StatelessWidget {
  const RoundButton({
    this.buttonColor = Colors.cyan,
    this.textColor = Colors.cyan,
    required this.title,
    required this.onPress,
    this.height = 50,
    this.width = double.infinity,
    this.loading = false,
    super.key});

  final bool loading;
  final String title;
  final double height , width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50)
        ),
        child: loading ?
        Center(child: CircularProgressIndicator()) :
        Center(child: Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConstant.whiteColor),),),
      ),
    );
  }
}
