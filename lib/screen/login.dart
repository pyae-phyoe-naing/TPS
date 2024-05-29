import 'package:flutter/material.dart';
import 'package:tps_ros/screen/login_setting.dart';
import 'package:tps_ros/widget/custom_app_bar.dart';
import 'package:tps_ros/widget/custom_button.dart';
import 'package:tps_ros/widget/custom_login_textfield.dart';
import 'package:tps_ros/widget/custom_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameCtl = TextEditingController();
    final TextEditingController passwordCtl = TextEditingController();
    return Scaffold(
      appBar: customAppBar(onPressed:(){
        Navigator.pop(
            context,);
      },),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Enter User  Name ',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 30,
                ),
               CustomLoginTextFormField(controller: nameCtl,validator: (str){},),
                const SizedBox(
                  height: 40,
                ),
                const CustomText(
                  text: 'Enter Password ',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 30,
                ),
                //customLoginTextField(),
                CustomLoginTextFormField(controller: passwordCtl,obscureText: true,validator: (str){},),

                const SizedBox(
                  height: 40,
                ),
                CustomButton(text: 'Login', onPressed: (){
                  _login(context);
                }),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login(context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>const LoginSetting(),
      ),
    );
  }
}
