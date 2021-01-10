import 'package:flutter/material.dart';
import 'package:pets/common/gradientButton.dart';
import 'package:pets/sign_up/sign_up_screen.dart';

import 'intro_screen2.dart';

class IntroScreen1 extends StatefulWidget {
  @override
  _IntroScreen1State createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  int whiteColor = 0xffffffff;
  int blueColor = 0xff6F7FFB;

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
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff5A6CFA),
                          const Color(0xff5A6CFA)
                        ],
                      ),
                      onPressed: () {
                        // print('button clicked');
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
