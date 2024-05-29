import 'package:flutter/material.dart';



class CustomLoginTextFormField extends StatelessWidget {
 final TextEditingController controller;
  final double width;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CustomLoginTextFormField({super.key,this.width=800,required this.controller,required this.validator,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return
   Container(
        alignment: Alignment.center,
        width: width,
        color: const Color(0xFFD9D9D9),
        child:  Padding(
          padding: const EdgeInsets.only(left: 30),
          child: TextFormField(
            validator: validator,
            obscureText: obscureText,
            controller: controller,
            cursorWidth: 5,
            cursorColor: Colors.black,
            style:
            const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(30),
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xFFD9D9D9),
            ),
          ),
        ),

    );
  }
}
