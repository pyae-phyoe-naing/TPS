
import 'package:flutter/material.dart';

AppBar customAppBar({required void Function()? onPressed}){
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 30),
      child: IconButton(
        splashRadius: 10,
        onPressed: onPressed,
        icon: const Column(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.white,
  );
}