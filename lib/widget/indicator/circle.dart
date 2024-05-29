
import 'package:flutter/material.dart';
import 'package:tps_ros/widget/custom_text.dart';

class Circle extends StatelessWidget {
  final String text;
  final Color color;
  const Circle({super.key,required this.text,this.color=const Color(0xFF648DF8)});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 72,
      height: 72,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        color:color ,
        borderRadius:const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child:  CustomText(
        text:text,
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
