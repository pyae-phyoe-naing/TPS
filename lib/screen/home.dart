import 'package:flutter/material.dart';
import 'package:tps_ros/dummy.dart';
import 'package:tps_ros/model/category.dart';
import 'package:tps_ros/screen/login.dart';
import 'package:tps_ros/screen/serial_key.dart';
import 'package:tps_ros/widget/custom_text.dart';
import 'package:tps_ros/widget/home_container.dart';
import 'package:tps_ros/widget/indicator/circle.dart';
import 'package:tps_ros/widget/indicator/line.dart';

class Home extends StatefulWidget {
  String? isLogin;

  Home({super.key, this.isLogin});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool successSerial = false;
  bool successLogin = false;

  @override
  void initState() {
    super.initState();
    if (widget.isLogin != null) {
      setState(() {
        successSerial = true;
        successLogin = true;
      });
    }

   for(var me in menus){
     Category category=categories.firstWhere((ca)=>ca.id == me.categoryId);
     print("${category.name} => ${me.name}");
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Circle(
                        text: '1',
                      ),
                      Line(
                        color: successSerial
                            ? const Color(0xFF648DF8)
                            : const Color(0xFFECECEC),
                      ),
                      const Circle(text: '2'),
                      Line(
                        color: successLogin
                            ? const Color(0xFF648DF8)
                            : const Color(0xFFECECEC),
                      ),
                      const Circle(text: '3'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          HomeContainer(
                            color: successSerial
                                ? const Color(0xFF1B3763)
                                : const Color(0xFF648DF8),
                            onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const SerialKey()))
                                  .then((val) {
                                if (val == 'success') {
                                  setState(() {
                                    successSerial = true;
                                  });
                                }
                              });
                            },
                          ),
                          const CustomText(
                            text: 'Serial',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          HomeContainer(
                            onTap: () {
                              if (!successSerial) return;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Login()),
                              );
                            },
                            color: successSerial && successLogin
                                ? const Color(0xFF1B3763)
                                : successSerial
                                    ? const Color(0xFF648DF8)
                                    : const Color(0xFFECECEC),
                            child: successLogin
                                ? const CustomText(
                                    text: 'Admin',
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                  )
                                : const Center(),
                          ),
                          const CustomText(
                            text: 'Login',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          HomeContainer(
                            color: successLogin
                                ? const Color(0xFF648DF8)
                                : const Color(0xFFECECEC),
                          ),
                          const CustomText(
                            text: 'Config',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          )
                        ],
                      ),
                    ],
                  ),
                  CustomText(
                    text: successSerial && !successLogin
                        ? '-Login with provided user name and password'
                        : successLogin && successSerial
                            ? '-Configure your shop for additional user/category/menu etc'
                            : '-Register your device with the serial key provided by TPS',
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/tps_logo.png',
            ),
          ],
        ),
      ),
    );
  }
}
