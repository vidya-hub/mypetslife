import 'package:flutter/material.dart';
import 'package:pets/common/indicatorSlide.dart';

class IntroScreen5 extends StatefulWidget {
  @override
  _IntroScreen5State createState() => _IntroScreen5State();
}

class _IntroScreen5State extends State<IntroScreen5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/foode3.png"), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              child: Container(
                height: 320,
                width: double.infinity,
                color: Colors.white,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 28.0, left: 30, right: 30),
                        child: Text(
                          "Who Does More ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5),
                        ),
                      ),
                      Text(
                        "Work",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Some Points for every chore you for your Pet Look at Dashboard on weekly, monthly points with your group",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              letterSpacing: 1.5),
                        ),
                      ),
                     indicatorSlide(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
