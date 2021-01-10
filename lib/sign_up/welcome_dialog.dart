import 'package:flutter/material.dart';
import 'package:pets/invite/invite_screen.dart';
import 'package:pets/sign_up/scheduling_time.dart';
import 'package:pets/common/bottom_nav.dart';

welcomeDialog(BuildContext context, String petName, var userdata) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          //this right here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ScheduledTimeScreen(),
                                ));
                          },
                          child: Icon(Icons.clear))),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset("assets/images/bo.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 48.0, top: 48),
                        child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage:
                                AssetImage("assets/images/bdog.png")),
                      ),
                    ],
                  ),
                  Text(
                    "Woof Woof !",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 29,
                        letterSpacing: 1.5,
                        wordSpacing: 2,
                        color: Colors.purple[900]),
                  ),
                  Text(
                    "$petName Is now onboard",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Color(0xff080040)),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Create Your Family",
                            style: TextStyle(color: Color(0xff080040)),
                          ),
                          color: Colors.white54,
                          onPressed: () {
                            print(userdata);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BottomNavigation(
                                    userdata: userdata,
                                  ),
                                ));
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.blueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Another pet",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
