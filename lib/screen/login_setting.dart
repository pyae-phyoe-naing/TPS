import 'package:flutter/material.dart';
import 'package:tps_ros/screen/home.dart';
import 'package:tps_ros/widget/custom_app_bar.dart';
import 'package:tps_ros/widget/custom_button.dart';
import 'package:tps_ros/widget/custom_text.dart';

class LoginSetting extends StatelessWidget {
  const LoginSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(onPressed:(){
        Navigator.push(
            context,MaterialPageRoute(builder: (_)=>Home(isLogin: 'fromLogin',)));
      },),

      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: (width / 7) * 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: (width / 7) * 1,
                      child: const CustomText(
                        text: 'User:',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const CustomText(
                      text: 'Admin',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (width / 7) * 1,
                      child: const CustomText(
                        text: 'Branch:',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const CustomText(
                      text: 'Main branch',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CustomButton(text: 'Switch User', onPressed: (){}),

                const SizedBox(
                  width: 20,
                ),
                CustomButton(text: 'Logout', onPressed: (){}),

              ],
            )
          ],
        ),
      ),
    );
  }
}
