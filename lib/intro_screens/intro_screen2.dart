import 'package:flutter/material.dart';
import 'package:pets/common/gradientButton.dart';
import 'package:pets/intro_screens/page_controller_screen.dart';
import 'package:pets/sign_up/sign_up_screen.dart';

import 'intro_screen3.dart';

class IntroScreen2 extends StatefulWidget {
  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  int whiteColor = 0xffffffff;
  int blueColor = 0xffDEFBFF;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(whiteColor), Color(blueColor)],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 48, right: 48),
                child: Image(
                  image: AssetImage("assets/images/pl.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 168.0, top: 12),
                child: Column(
                  children: [
                    Text(
                      "Welcome to",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 33),
                    ),
                    Text(
                      "My Pets Life",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          letterSpacing: 2,
                          wordSpacing: 2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 142.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  child: RaisedGradientButton(
                      child: Text(
                        'Register for FREE    ➜ ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xffcac8cf),
                          const Color(0xffcac8cf)
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpScreen()));
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
