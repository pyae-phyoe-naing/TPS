
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final Color color;
  const Line({super.key,this.color=const Color(0xFFECECEC)});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 329,
      height: 10,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
