
import 'package:flutter/material.dart';
import 'package:tps_ros/widget/custom_text.dart';

class CustomButton extends StatelessWidget {
 final double width;
  final double height;
  final String text;
  final void Function()? onPressed;
  const CustomButton({super.key,required this.text,required this.onPressed,this.width=296,this.height=96});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B3763),
        ),
        child:  CustomText(
          text: text,
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
