
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final Widget child;
  const HomeContainer({super.key,this.onTap,this.child =const Text(''),this.color=const  Color(0xFFECECEC)});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        margin:
        const EdgeInsets.only(right: 25, bottom: 10),
        width: 296,
        height: 260,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: color,),
        child: child,
      ),
    );
  }
}
