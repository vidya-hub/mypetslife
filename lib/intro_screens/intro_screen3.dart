import 'package:flutter/material.dart';
import 'package:pets/common/indicatorSlide.dart';

import 'intro_screen4.dart';

class IntroScreen3 extends StatefulWidget {
  @override
  _IntroScreen3State createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  int whiteColor = 0xffffffff;
  int blueColor = 0xffDEFBFF;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/dogp.png"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 168.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Automate",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 28),
                      ),
                    ),
                    Text(
                      " Pet's Chores",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 38.0, right: 38, top: 10),
                      child: Text(
                        " Let us manage your Pet’s chores and make it fun. Score points among your loved ones and leave the headache to us",
                        style: TextStyle(fontSize: 18, color: Colors.black38),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 310.0),
                      child: indicatorSlide(),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
