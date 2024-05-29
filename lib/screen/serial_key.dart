import 'package:flutter/material.dart';
import 'package:tps_ros/widget/custom_text.dart';

class SerialKey extends StatefulWidget {
  const SerialKey({super.key});

  @override
  State<SerialKey> createState() => _SerialKeyState();
}

class _SerialKeyState extends State<SerialKey> {
  String _serialKey = "12345678";
  bool status = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //----------- TextField -----------------------

              Container(
                alignment: Alignment.center,
                width: 1000,
                color: const Color(0xFFD9D9D9),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: TextField(
                    controller: controller,
                    onChanged: (key) {
                      if (key == _serialKey) {
                        setState(() {
                          status = true;
                        });
                      } else {
                        setState(() {
                          status = false;
                        });
                      }
                    },
                    cursorWidth: 5,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(30),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9),
                      suffixIcon: InkWell(
                        onTap: (){
                          if(status){
                            Navigator.pop(context,'success');
                          }
                          return;
                        },
                        child: Container(
                            padding: const EdgeInsets.all(44),
                            width: 135,
                            color: status
                                ? const Color(0xFF4EF200)
                                : const Color(0xFF797C78),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 50,
                            )),
                      ),
                    ),
                  ),
                ),
              ),

              //----------- Verify -----------------------
              status
                  ? Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: const CustomText(
                        text: 'verified   1/ 5',
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
