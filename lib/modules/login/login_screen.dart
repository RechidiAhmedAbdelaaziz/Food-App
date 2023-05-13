// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/Shared/Components/compenents.dart';
import 'package:social_app/modules/signup/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('4D4D4D'),
      body: Column(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
                color: HexColor('FFBF9B'),
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(60),
                )),
            padding: EdgeInsetsDirectional.only(start: 30, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Login\nNow.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  defaultFromFiled(
                    control: TextEditingController(),
                    lable: 'Email Address',
                    lableStyle: TextStyle(
                      color: HexColor('FFBF9B'),
                    ),
                    prefix: Icon(
                      Icons.mail_outlined,
                      color: HexColor('FFBF9B'),
                    ),
                    focusBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('FFBF9B'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFromFiled(
                    control: TextEditingController(),
                    lable: 'Password',
                    lableStyle: TextStyle(
                      color: HexColor('FFBF9B'),
                    ),
                    secure: true,
                    prefix: Icon(
                      Icons.lock_outline,
                      color: HexColor('FFBF9B'),
                    ),
                    focusBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('FFBF9B'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: HexColor('FFBF9B'),
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("if you don't have account,"),
                      TextButton(
                        onPressed: () {
                          navigateTo(
                              context: context, widget: RegisterScreen());
                        },
                        child: Text(
                          'Reginster Now',
                          style: TextStyle(
                            color: HexColor('FFBF9B'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
