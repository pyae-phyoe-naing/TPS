import 'package:flutter/material.dart';
import 'package:tps_ros/dummy.dart';
import 'package:tps_ros/screen/home.dart';
import 'package:tps_ros/screen/login.dart';
import 'package:tps_ros/screen/login_setting.dart';
import 'package:tps_ros/screen/order.dart';
import 'package:tps_ros/screen/serial_key.dart';
import 'package:tps_ros/screen/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Order(),
    );
  }
}

