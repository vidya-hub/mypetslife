import 'package:flutter/material.dart';
import 'package:pets/Service/useridStore.dart';

import 'package:pets/intro_screens/intro_screen1.dart';
import 'package:pets/intro_screens/intro_screen2.dart';
import 'package:pets/intro_screens/intro_screen3.dart';
import 'package:pets/intro_screens/intro_screen4.dart';
import 'package:pets/intro_screens/intro_screen5.dart';
import 'package:pets/sign_up/sign_up_screen.dart';
import 'dart:async';

class PageViewerScreen extends StatefulWidget {
  @override
  _PageViewerScreenState createState() => _PageViewerScreenState();
}

class _PageViewerScreenState extends State<PageViewerScreen> {
  final controller = PageController(initialPage: 0);
  int current = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (current < 5) {
        current++;
      } else {
        current = 5;
      }
      controller.animateToPage(
        current,
        duration: Duration(seconds: 1),
        curve: Curves.easeInCubic,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (int i) {
                  setState(() {
                    current = i;
                    print(current);
                  });
                },
                children: [
                  IntroScreen1(),
                  IntroScreen2(),
                  IntroScreen3(),
                  IntroScreen4(),
                  IntroScreen5(),
                  SignUpScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    SharedPref().remove("userjsondata");
                    SharedPref().remove("userData");
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }
}
