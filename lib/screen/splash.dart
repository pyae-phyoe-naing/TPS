import 'package:flutter/material.dart';
import 'package:tps_ros/screen/home.dart';
import 'package:tps_ros/widget/custom_text.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller1 = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation1 = CurvedAnimation(parent: controller1, curve: Curves.easeIn);

    controller2 = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeIn);

    controller3 = AnimationController(
        duration: const Duration(milliseconds: 3500), vsync: this);
    animation3 = CurvedAnimation(parent: controller3, curve: Curves.easeIn);

    controller1.forward();
    controller2.forward();
    controller3.forward();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) =>  Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: animation1,
                  child: const CustomText(
                    text: 'WELCOME',
                    fontSize: 100,
                    color: Color(0xFF1B3763),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                FadeTransition(
                  opacity: animation2,
                  child: const CustomText(
                    text: 'Restaurant Management System',
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: FadeTransition(
                opacity: animation3,
                child: Image.asset(
                  'assets/images/tps_logo.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
