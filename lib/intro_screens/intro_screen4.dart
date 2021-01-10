import 'package:flutter/material.dart';
import 'package:pets/common/indicatorSlide.dart';

class IntroScreen4 extends StatefulWidget {
  @override
  _IntroScreen4State createState() => _IntroScreen4State();
}

class _IntroScreen4State extends State<IntroScreen4> {
  int whiteColor = 0xffffffff;
  int blueColor = 0xffDEFBFF;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Color(0xff000000), BlendMode.overlay),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/dog2.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 169.0),
                  child: Column(
                    children: [
                      Text(
                        "Manage your Pet ",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      Text(
                        " easily with your ",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      Text(
                        " family/friends",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: Text(
                          " We will Notifiy your group about",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 80.0, right: 90, top: 19),
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage("assets/images/npfood.png")),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Meal Times Walk Times VET Appointments Play Dates",
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 28.0, left: 60, right: 60),
                        child: Text(
                          "Each Family member can pick and do the work and score points",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      indicatorSlide(),

                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
